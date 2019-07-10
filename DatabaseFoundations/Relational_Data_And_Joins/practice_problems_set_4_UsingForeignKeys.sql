/*
Exercise 2

Update the orders table so that referential integrity will
be preserved for the data between orders and products.
*/
ALTER TABLE orders ADD CONSTRAINT orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);

/*
Exercise 3

Use psql to insert the data shown in the following table into the database:

Quantity	Product
10			small bolt
25			small bolt
15			large bolt
*/
INSERT INTO products (name) VALUES
('small bolt'),
('large bolt');

INSERT INTO orders (product_id, quantity) VALUES
(1, 10), (1, 25), (2, 15);

/*
Exercise 4

Write a SQL statement that returns a result like this:

 quantity |    name
----------+------------
       10 | small bolt
       25 | small bolt
       15 | large bolt
(3 rows)
*/
SELECT o.quantity, p.name
FROM orders AS o
INNER JOIN products AS p
ON o.product_id = p.id;

/*
Exercise 5

Can you insert a row into orders without a product_id?
Write a SQL statement to prove your answer.
*/
INSERT INTO orders (quantity) VALUES (30);
/*
this worked because there is no NOT NULL
constraint on the product_id column in
the orders table
*/

/*
Exercise 6

Write a SQL statement that will prevent NULL values from
being stored in orders.product_id. What happens if you
execute that statement?
*/
ALTER TABLE orders ALTER COLUMN product_id SET NOT NULL;
-- this will not work as a NULL value already exists in
-- the product_id column of one of the records

/*
Exercise 7

Make any changes needed to avoid the error message encountered in #6.
*/
DELETE FROM orders WHERE id = 4;
ALTER TABLE orders ALTER COLUMN product_id SET NOT NULL;

/*
Exercise 8

Create a new table called reviews to store the data shown below. This table should include a primary key and a reference to the products table.

Product			Review
small bolt		a little small
small bolt		very round!
large bolt		could have been smaller
*/
CREATE TABLE reviews (
	id SERIAL PRIMARY KEY,
	product_id INTEGER REFERENCES products(id) NOT NULL,
	body text NOT NULL
);

/*
Exercise 9

Write SQL statements to insert the data shown in the table in #8.
*/
INSERT INTO reviews (product_id, body) VALUES
(1, 'a little small'),
(1, 'very round!'),
(2, 'could have been smaller');

-- to get the results in Exercise 8, we can
-- use the following query:
SELECT p.name AS "Product", r.body AS "Review"
FROM products AS p
INNER JOIN reviews AS r
ON p.id = r.product_id;

/*
Exercise 10

True or false: A foreign key constraint prevents NULL values from being stored in a column.

False, it just ensures any entry in the column must have an indentical entry in the primary
key column of the other table

One must explicitly put a NOT NULL constraint on the foreign key column
*/

