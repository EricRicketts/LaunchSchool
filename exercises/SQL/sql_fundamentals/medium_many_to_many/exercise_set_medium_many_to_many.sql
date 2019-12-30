/*
Exercise 1

Setup Database

In this set of exercises, we will work with a billing database for a company that
provides web hosting services to its customers. The database will contain information
about its customers and the services each customer uses. Each customer can have any
number of services, and every service can have any number of customers. Thus, there
will be a many-to-many (M:M) relationship between the customers and the services.
Some customers don't presently have any services, and not every service must be in
use by any customers.

Initially, we need to create a billing database with a customers table and a services
table.

***************************************************************************************
The customers table should include the following columns:

"id" is a unique numeric customer id that auto-increments and serves as a primary key
for this table.

"name" is the customer's name. This value must be present in every record and may contain names of any length.

"payment_token" is an 8-character string that consists of solely uppercase alphabetic letters.
It identifies each customer's payment information with the payment processor the company uses.
****************************************************************************************
The services table should include the following columns:

"id" is a unique numeric service id that auto-increments and serves as a primary key for this table.

"description" is the service description. This value must be present and may contain any text.

"price" is the annual service price. It must be present, must be greater than or equal to 0.00. The data type is numeric(10, 2).
****************************************************************************************

Once you've created these tables, here is some data that you can enter into them (feel free to enter some data of your own as well):

-- Data for the customers table

id | name          | payment_token
--------------------------------
1  | Pat Johnson   | XHGOAHEQ
2  | Nancy Monreal | JKWQPJKL
3  | Lynn Blake    | KLZXWEEE
4  | Chen Ke-Hua   | KWETYCVX
5  | Scott Lakso   | UUEAPQPS
6  | Jim Pornot    | XKJEYAZA
-- Data for the services table

id | description         | price
---------------------------------
1  | Unix Hosting        | 5.95
2  | DNS                 | 4.95
3  | Whois Registration  | 1.95
4  | High Bandwidth      | 15.00
5  | Business Support    | 250.00
6  | Dedicated Hosting   | 50.00
7  | Bulk Email          | 250.00
8  | One-to-one Training | 999.00

Once you have entered the data into your tables, create a join table that associates customers with services and vice versa.
The join table should have columns for both the services id and the customers id, as well as a primary key named id that auto-increments.
Enter some data in the join table that shows which services each customer uses as follows:

Pat Johnson uses Unix Hosting, DNS, and Whois Registration
Nancy Monreal doesn't have any active services
Lynn Blake uses Unix Hosting, DNS, Whois Registration, High Bandwidth, and Business Support
Chen Ke-Hua uses Unix Hosting and High Bandwidth
Scott Lakso uses Unix Hosting, DNS, and Dedicated Hosting
Jim Pornot uses Unix Hosting, Dedicated Hosting, and Bulk Email

The customer id in this table should have the property that deleting the corresponding customer record from the customers table will
automatically delete all rows from the join table that have that customer_id. Do not apply this same property to the service id.
*/
-- createdb billing
-- psql -d billing
CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
	"name" text NOT NULL,
	payment_token CHAR(8) NOT NULL,
	CHECK (strpos(payment_token, ' ') = 0 AND payment_token = UPPER(payment_token) AND length(payment_token) = 8)
);
-- Launch School check was better CHECK (payment_token ~ '^[A-Z]{8}$')

CREATE TABLE services (
	id SERIAL PRIMARY KEY,
	description TEXT NOT NULL,
	price NUMERIC(10, 2) NOT NULL,
	CHECK (price >= 0.00)
);

INSERT INTO customers ("name", payment_token) VALUES
('Pat Johnson', 'XHGOAHEQ'),
('Nancy Monreal', 'JKWQPJKL'),
('Lynn Blake', 'KLZXWEEE'),
('Chen Ke-Hua', 'KWETYCVX'),
('Scott Lakso', 'UUEAPQPS'),
('Jim Pornot', 'XKJEYAZA');

INSERT INTO services (description, price) VALUES
('Unix Hosting', 5.95),
('DNS', 4.95),
('Whois Registration', 1.95),
('High Bandwidth', 15.00),
('Business Support', 250.00),
('Dedicated Hosting', 50.00),
('Bulk Email', 250.00),
('One-to-one Training', 999.00);

CREATE TABLE customers_services (
	id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
	service_id INTEGER NOT NULL REFERENCES services(id),
	UNIQUE(customer_id, service_id)
);

INSERT INTO customers_services (customer_id, service_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(4, 1),
(4, 4),
(5, 1),
(5, 2),
(5, 6),
(6, 1),
(6, 6),
(6, 7);

-- Now I need check my results
SELECT c.name AS "customer name", string_agg(s.description, ', ') AS "services"
FROM customers AS c
INNER JOIN customers_services AS cs
ON c.id = cs.customer_id
INNER JOIN services AS s
ON cs.service_id = s.id
GROUP BY c.id;
-- works!!

/*
Exercise 2

Get Customers With Services

Write a query to retrieve the customer data for every customer who currently subscribes to at least one service.
*/

SELECT c.name, c.payment_token
FROM customers AS c
INNER JOIN customers_services AS cs
ON c.id = cs.customer_id
GROUP BY c.id;

-- this is the Launch School solution
SELECT DISTINCT c.name, c.payment_token
FROM customers AS c
INNER JOIN customers_services AS cs
ON c.id = cs.customer_id;

/*
Exercise 3

Get Customers With No Services

Write a query to retrieve the customer data for every customer who does not currently subscribe to any services.
*/
SELECT c.name, c.payment_token
FROM customers AS c
LEFT OUTER JOIN customers_services AS cs
ON c.id = cs.customer_id
WHERE cs.customer_id IS NULL;

/*
Further Exploration

Can you write a query that displays all customers with no services and all services that currently don't have
any customers? The output should look like this:

 id |     name      | payment_token | id |     description     | price
----+---------------+---------------+----+---------------------+--------
  2 | Nancy Monreal | JKWQPJKL      |    |                     |
    |               |               |  8 | One-to-one Training | 999.00
(2 rows)
*/
SELECT c.*, s.*
FROM customers AS c
LEFT OUTER JOIN customers_services AS cs
ON c.id = cs.customer_id
FULL OUTER JOIN services AS s
ON cs.service_id = s.id
WHERE (cs.customer_id IS NULL) OR (cs.service_id IS NULL);

/*
Exercise 4

Get Services With No Customers

Using RIGHT OUTER JOIN, write a query to display a list of all services that are not currently in use.
Your output should look like this:

 description
-------------
 One-to-one Training
(1 row)
*/
SELECT s.description
FROM customers_services AS cs
RIGHT OUTER JOIN services AS s
ON cs.service_id = s.id
WHERE cs.service_id IS NULL;

/*
Exercise 5

Services for each Customer

Write a query to display a list of all customer names together with a comma-separated list of the
services they use. Your output should look like this:

     name      |                                services
---------------+-------------------------------------------------------------------------
 Pat Johnson   | Unix Hosting, DNS, Whois Registration
 Nancy Monreal |
 Lynn Blake    | DNS, Whois Registration, High Bandwidth, Business Support, Unix Hosting
 Chen Ke-Hua   | High Bandwidth, Unix Hosting
 Scott Lakso   | DNS, Dedicated Hosting, Unix Hosting
 Jim Pornot    | Unix Hosting, Dedicated Hosting, Bulk Email
(6 rows)
*/
SELECT c.name AS "name", string_agg(s.description, ', ') AS "services"
FROM customers AS c
LEFT OUTER JOIN customers_services AS cs
ON c.id = cs.customer_id
LEFT OUTER JOIN services AS s
ON cs.service_id = s.id
GROUP BY c.name, c.id
ORDER BY c.id;

/*
Further Exploration

Can you modify the above command so the output looks like this?

     name      |    description
---------------+--------------------
 Chen Ke-Hua   | High Bandwidth
               | Unix Hosting
 Jim Pornot    | Dedicated Hosting
               | Unix Hosting
               | Bulk Email
 Lynn Blake    | Whois Registration
               | High Bandwidth
               | Business Support
               | DNS
               | Unix Hosting
 Nancy Monreal |
 Pat Johnson   | Whois Registration
               | DNS
               | Unix Hosting
 Scott Lakso   | DNS
               | Dedicated Hosting
               | Unix Hosting
(17 rows)

This won't be easy! Hint: you will need to use the window lag function
together with a CASE condition in your SELECT. To get you started,
try this command:

SELECT customers.name,
       lag(customers.name)
         OVER (ORDER BY customers.name)
         AS previous,
       services.description
FROM customers
LEFT OUTER JOIN customers_services
             ON customer_id = customers.id
LEFT OUTER JOIN services
             ON services.id = service_id;

Examine the relationship between the previous column and the rest of
the table to get a handle on what lag does.
*/

/*
Exercise 6

Services With At Least 3 Customers

Write a query that displays the description for every service that is
subscribed to by at least 3 customers. Include the customer count for
each description in the report. The report should look like this:

 description  | count
--------------+-------
 DNS          |     3
 Unix Hosting |     5
(2 rows)
*/
SELECT s.description, count(cs.service_id) AS "count"
FROM services AS s
INNER JOIN customers_services AS cs
ON s.id = cs.service_id
GROUP BY s.description
HAVING count(cs.service_id) >= 3
ORDER BY "count" ASC;

/*
Exercise 7

Total Gross Income

Assuming that everybody in our database has a bill coming due,
and that all of them will pay on time, write a query to compute
the total gross income we expect to receive.

Answer:

  gross
 --------
 678.50
(1 row)
*/
SELECT sum(s.price) AS "gross"
FROM services AS s
INNER JOIN customers_services AS cs
ON s.id = cs.service_id;

/*
Exercise 8

Add New Customer

A new customer, 'John Doe', has signed up with our company. His payment token is 'EYODHLCN'.
Initially, he has signed up for UNIX hosting, DNS, and Whois Registration. Create any SQL
statement(s) needed to add this record to the database.
*/
INSERT INTO customers ("name", payment_token) VALUES
('John Doe', 'EYODHLCN');

INSERT INTO customers_services (customer_id, service_id) VALUES
(7, 1),
(7, 2),
(7, 3);

-- check insertion works across tables
SELECT c.name, string_agg(s.description, ', ') AS "services"
FROM customers AS c
INNER JOIN customers_services AS cs
ON c.id = cs.customer_id
INNER JOIN services AS s
ON cs.service_id = s.id
GROUP BY c.name
HAVING c.name = 'John Doe';
-- it works!!

/*
Exercise 9

Hypothetically

The company president is looking to increase revenue. As a prelude to his decision making,
he asks for two numbers: the amount of expected income from "big ticket" services (those
services that cost more than $100) and the maximum income the company could achieve if it
managed to convince all of its customers to select all of the company's big ticket items.

For simplicity, your solution should involve two separate SQL queries: one that reports
the current expected income level, and one that reports the hypothetical maximum.
The outputs should look like this:

 sum
--------
 500.00
(1 row)

   sum
---------
 10493.00
(1 row)
*/
SELECT sum(s.price) AS "Sum of Big Ticket Items"
FROM services AS s
INNER JOIN customers_services AS cs
ON s.id = cs.service_id
GROUP BY s.price
HAVING s.price > 100;
-- works!!  gives me the first answer
-- Launch School solution
SELECT SUM(price)
FROM customers
INNER JOIN customers_services
        ON customers.id = customer_id
INNER JOIN services
        ON service_id = services.id
WHERE price > 100;

-- Second problem I had to look at
-- the answer I would have never
-- thought of cross join

SELECT sum(s.price) AS "Hypothetically"
FROM customers AS c
CROSS JOIN services AS s
WHERE s.price > 100;

/*
Experimentation

SELECT *
FROM customers
CROSS JOIN services;

SELECT *
FROM customers
CROSS JOIN services
WHERE price > 100;
*/

/*
Exercise 10

Deleting Rows

Write the necessary SQL statements to delete the "Bulk Email"
service and customer "Chen Ke-Hua" from the database.
*/
-- I wrote these statements but did not execuate them
DELETE FROM customers_services WHERE customers_services.service_id = 7;
DELETE FROM services WHERE description = 'Bulk Email';
-- have to delete in order because otherwise deleting 'Bulk Email'
-- first will cause an error in the join table

DELETE FROM customers WHERE "name" = 'Chen Ke-Hua'
-- by the cascade it should eliminate all of the
-- customer records in customers_services with
-- Chen Ke-Hua's id


