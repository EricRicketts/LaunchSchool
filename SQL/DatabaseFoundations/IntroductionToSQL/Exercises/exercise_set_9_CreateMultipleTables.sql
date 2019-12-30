/*
Exercise 1

Make sure you are connected to the encyclopedia database.
We want to hold the continent data in a separate table from the country data.

1.  Create a continents table with an auto-incrementing id column (set as the Primary Key),
and a continent_name column which can hold the same data as the continent column from the countries table.
2.  Remove the continent column from the countries table.
3.  Add a continent_id column to the countries table of type integer.
4.  Add a Foreign Key constraint to the continent_id column which references the id field of the continents table.
*/
ALTER TABLE countries DROP COLUMN continent;

CREATE TABLE continents (
	id SERIAL PRIMARY KEY,
	continent_name VARCHAR(50),
	PRIMARY KEY (id)
);

ALTER TABLE countries ADD PRIMARY KEY (id);
ALTER TABLE countries ADD COLUMN continent_id INTEGER;
ALTER TABLE countries ADD CONSTRAINT continent_fk FOREIGN KEY (continent_id) REFERENCES continents(id);

/*
Exercise 2

Write queries to add data to the countries and continents tables so that the data below is correctly
represented across the two tables. Add both the countries and the continents to their respective
tables in alphabetical order.

Name		Capital				Population		Continent
Brazil		Brasilia			208,385,000		South America
Egypt		Cairo				96,308,900		Africa
France		Paris				67,158,000		Europe
Germany		Berlin				82,349,400		Europe
Japan		Tokyo				126,672,000		Asia
USA			Washington D.C.		325,365,189		North America

 id | continent_name
----+----------------
  1 | Africa
  2 | Asia
  3 | Europe
  4 | North America
  5 | South America
*/

-- just in case there is any data
DELETE FROM countries;
INSERT INTO continents (continent_name) VALUES
('Africa'),
('Asia'),
('Europe'),
('North America'),
('South America');
INSERT INTO countries (name, continent_id, capital, population) VALUES
('Brazil', 5, 'Brasilia', 208385000),
('Egypt', 1, 'Cairo', 96308900),
('France', 3, 'Paris', 67158000),
('Germany', 3, 'Berlin', 82349400),
('Japan', 2, 'Tokyo', 126672000),
('USA', 4, 'Washington D.C.', 325365189);

/*
Exercise 3

Examine the data below:

singer_id	Album Name			Released			Genre								Label						Singer Name
1			Born to Run			August 25, 1975		Rock and roll						Columbia					Bruce Springsteen
6			Purple Rain			June 25, 1984		Pop, R&B, Rock						Warner Bros					Prince
1			Born in the USA		June 4, 1984		Rock and roll, pop					Columbia					Bruce Springsteen
5			Madonna				July 27, 1983		Dance-pop, post-disco				Warner Bros					Madonna
5			True Blue			June 30, 1986		Dance-pop, Pop						Warner Bros					Madonna
7			Elvis				October 19, 1956	Rock and roll, Rhythm and Blues		RCA Victor					Elvis Presley
6			Sign o' the Times	March 30, 1987		Pop, R&B, Rock, Funk				Paisley Park, Warner Bros	Prince
7			G.I. Blues			October 1, 1960		Rock and roll, Pop					RCA Victor					Elvis Presley

We want to create an albums table to hold all the above data except the singer name,
and create a reference from the albums table to the singers table to link the each
album to the correct singer. Write the necessary SQL statements to do this and to
populate the table with data. Assume Album Name, Genre, and Label can hold strings
up to 100 characters. Include an auto-incrementing id column in the albums table.

 id | first_name |             occupation              | date_of_birth | deceased |   last_name
----+------------+-------------------------------------+---------------+----------+----------------
  1 | Bruce      | Singer, Songwriter                  | 1949-09-23    | f        | Springsteen
  5 | Madonna    | Singer, Actress                     | 1958-08-16    | f        | Louise Ciccone
  6 | Prince     | Singer, Songwriter, Musician, Actor | 1958-06-07    | t        | Rogers Nelson
  7 | Elvis      | Singer, Musican, Actor              | 1935-01-08    | t        | Presley
  8 | Frank      | Singer, Actor                       | 1915-12-12    | t        | Sinatra
*/

CREATE TABLE albums (
	id SERIAL PRIMARY KEY,
	singer_id INTEGER,
	album_name VARCHAR(100),
	released DATE,
	genre VARCHAR(100),
	label VARCHAR(100),
	FOREIGN KEY (singer_id) REFERENCES singers(id);
);

INSERT INTO albums (singer_id, album_name, released, genre, label) VALUES
(1, 'Born to Run', 'August 25, 1975', 'Rock and roll', 'Columbia'),
(6, 'Purple Rain', 'June 25, 1984', 'Pop, R&B, Rock', 'Warner Bros'),
(1, 'Born in the USA', 'June 4, 1984', 'Rock and roll, pop', 'Columbia'),
(5, 'Madonna', 'July 27, 1983', 'Dance-pop, post-disco', 'Warner Bros'),
(5,  'True Blue', 'June 30, 1986', 'Dance-pop, Pop', 'Warner Bros'),
(7,	 'Elvis', 'October 19, 1956', 'Rock and roll, Rhythm and Blues', 'RCA Victor'),
(6,	 'Sign o ''the Times', 'March 30, 1987', 'Pop, R&B, Rock, Funk', 'Paisley Park, Warner Bros'),
(7,	 'G.I. Blues', 'October 1, 1960', 'Rock and roll, Pop', 'RCA Victor');

/*
Exercise 4

Connect to the ls_burger database. If you run a simple SELECT query to retreive all the data from the orders table,
you will see it is very unnormalised. We have repetition of item names and costs and of customer data.

 id | customer_name  |            burger             |    side     |      drink      |     customer_email      | customer_loyalty_points | burger_cost | side_cost | drink_cost
----+----------------+-------------------------------+-------------+-----------------+-------------------------+-------------------------+-------------+-----------+------------
  2 | Natasha O'Shea | LS Cheeseburger               | Fries       |                 | natasha@osheafamily.com |                      18 |        3.50 |      1.20 |       0.00
  1 | James Bergman  | LS Chicken Burger             | Fries       | Lemonade        | james1998@email.com     |                      28 |        4.50 |      1.20 |       1.50
  4 | Aaron Muller   | LS Burger                     | Fries       |                 |                         |                      13 |        3.00 |      1.20 |       0.00
  3 | Natasha O'Shea | LS Double Deluxe Cheeseburger | Onion Rings | Chocolate Shake | natasha@osheafamily.com |                      42 |        6.00 |      1.50 |       2.00

We want to break this table up into multiple tables. First of all create a customers table to hold the customer name
data and an email_addresses table to hold the customer email data. Create a one-to-one relationship between them,
ensuring that if a customer record is deleted so is the equivalent email address record. Populate the tables with
the appropriate data from the current orders table.
*/
CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
	customer_name VARCHAR(100)
);

CREATE TABLE email_addresses (
	customer_id INTEGER PRIMARY KEY,
	customer_email VARCHAR(100),
	FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);

INSERT INTO customers (customer_name) VALUES
('Natasha O''Shea'),
('James Bergman'),
('Aaron Muller');

INSERT INTO email_addresses (customer_id, customer_email) VALUES
(1, 'natasha@osheafamily.com'),
(2, 'james1998@email.com'),
(3, NULL);

/*
Exercise 5

We want to make our ordering system more flexible, so that customers can order any combination of burgers, sides and drinks.
The first step towards doing this is to put all our product data into a separate table called products.
Create a table and populate it with the following data:

Product Name				Product Cost	Product Type	Product Loyalty Points
LS Burger					3.00			Burger			10
LS Cheeseburger				3.50			Burger			15
LS Chicken Burger			4.50			Burger			20
LS Double Deluxe Burger		6.00			Burger			30
Fries						1.20			Side			3
Onion Rings					1.50			Side			5
Cola						1.50			Drink			5
Lemonade					1.50			Drink			5
Vanilla Shake				2.00			Drink			7
Chocolate Shake				2.00			Drink			7
Strawberry Shake			2.00			Drink			7

The table should also have an auto-incrementing id column which acts as its PRIMARY KEY.
The product_type column should hold strings of up to 20 characters. Other than that,
the column types should be the same as their equivalent columns from the orders table.
*/
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	product_name VARCHAR(50),
	product_cost DECIMAL(4, 2) DEFAULT 0.00,
	product_type VARCHAR(20),
	product_loyalty_points INTEGER
);

INSERT INTO products (product_name, product_cost, product_type, product_loyalty_points) VALUES
('LS Burger', 3.00, 'Burger', 10),
('LS Cheeseburger', 3.50, 'Burger', 15),
('LS Chicken Burger', 4.50, 'Burger', 20),
('LS Double Deluxe Burger', 6.00, 'Burger', 30),
('Fries', 1.20, 'Side', 3),
('Oninon Rings', 1.50, 'Side', 5),
('Cola', 1.50, 'Drink', 5),
('Lemonade', 1.50, 'Drink', 5),
('Vanilla Shake', 2.00, 'Drink', 7),
('Chocolate Shake', 2.00, 'Drink', 7),
('Strawberry Shake', 2.00, 'Drink', 7);

/*
Exercise 6

To associate customers with products, we need to do two more things:

1.  Alter or replace the orders table so that we can associate a customer with one or more orders
(we also want to record an order status in this table).
2.  Create an order_items table so that an order can have one or more products associated with it.

Based on the order descriptions below, amend and create the tables as necessary and populate them with the appropriate data.

James has one order, consisting of a Chicken Burger, Fries, Onion Rings, and a Lemonade. It has a status of 'In Progress'.

Natasha has two orders. The first consists of a Cheeseburger, Fries, and a Cola, and has a status of 'Placed';
the second consists of a Double Deluxe Burger, a Cheeseburger, two sets of Fries, Onion Rings, a Chocolate Shake and a Vanilla Shake, and has a status of 'Complete'.

Aaron has one order, consisting of an LS Burger and Fries. It has a status of 'Placed'.

Assume that the order_status field of the orders table can hold strings of up to 20 characters.

 id | customer_name
----+----------------
  1 | Natasha O'Shea
  2 | James Bergman
  3 | Aaron Muller
(3 rows)

 customer_id |     customer_email
-------------+-------------------------
           1 | natasha@osheafamily.com
           2 | james1998@email.com
(2 rows)

ls_burger=# SELECT * FROM products;
 id |      product_name       | product_cost | product_type | product_loyalty_points
----+-------------------------+--------------+--------------+------------------------
  1 | LS Burger               |         3.00 | Burger       |                     10
  2 | LS Cheeseburger         |         3.50 | Burger       |                     15
  3 | LS Chicken Burger       |         4.50 | Burger       |                     20
  4 | LS Double Deluxe Burger |         6.00 | Burger       |                     30
  5 | Fries                   |         1.20 | Side         |                      3
  6 | Oninon Rings            |         1.50 | Side         |                      5
  7 | Cola                    |         1.50 | Drink        |                      5
  8 | Lemonade                |         1.50 | Drink        |                      5
  9 | Vanilla Shake           |         2.00 | Drink        |                      7
 10 | Chocolate Shake         |         2.00 | Drink        |                      7
 11 | Strawberry Shake        |         2.00 | Drink        |                      7
 (11 rows)
*/
-- IF orders already exists
DROP TABLE orders;
CREATE TABlE orders (
	id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	order_status VARCHAR(20),
	FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);
CREATE TABLE order_items (
	id SERIAL PRIMARY KEY,
	order_id INTEGER NOT NULL,
	product_id INTEGER NOT NULL,
	FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
	FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);
INSERT INTO orders (customer_id, order_status) VALUES
(1, 'Placed'),
(1, 'Complete'),
(2, 'In Progress'),
(3, 'Placed');

INSERT INTO order_items (order_id, product_id) VALUES
(1, 2),
(1, 5),
(1, 7),
(2, 4),
(2, 2),
(2, 5),
(2, 5),
(2, 6),
(2, 10),
(2, 9),
(3, 3),
(3, 5),
(3, 8),
(4, 1),
(4, 5);




