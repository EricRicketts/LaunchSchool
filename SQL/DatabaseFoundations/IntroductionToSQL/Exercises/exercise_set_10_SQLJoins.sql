-- Exercise 1
-- Connect to the encyclopedia database. Write a query to return all of the country names
-- along with their appropriate continent names.
SELECT countries.name, continents.continent_name FROM countries
INNER JOIN continents ON (countries.continent_id = continents.id);

-- Exercise 2
-- Write a query to return all of the names and capitals of the European countries.
SELECT countries.name, countries.capital FROM countries
INNER JOIN continents ON (countries.continent_id = continents.id)
WHERE (continents.continent_name = 'Europe');

-- Exercise 3
-- Write a query to return the first name of any singer who had an album released under the Warner Bros label.
SELECT DISTINCT singers.first_name FROM singers
INNER JOIN albums ON (singers.id = albums.singer_id)
WHERE (albums.label LIKE '%Warner Bros%');

-- Exercise 4
-- Write a query to return the first name and last name of any singer who released an album in the 80s
-- and who is still living, along with the names of the album that was released and the release date.
-- Order the results by the singer's age (youngest first).
SELECT singers.first_name, singers.last_name, albums.album_name, albums.released FROM singers
INNER JOIN albums ON (singers.id = albums.singer_id)
WHERE date_part('year', albums.released) >= 1980 AND date_part('year', albums.released) <= 1989 AND singers.deceased = false
ORDER BY date_part('year', singers.date_of_birth) DESC;

-- Exercise 5
-- Write a query to return the first name and last name of any singer without an associated album entry.
SELECT singers.first_name, singers.last_name FROM singers
LEFT JOIN albums ON (singers.id = albums.singer_id)
WHERE (albums.singer_id IS NULL);

-- Exercise 6
-- Rewrite the query for the last question as a sub-query.
SELECT singers.first_name, singers.last_name FROM singers
WHERE singers.id NOT IN (SELECT albums.singer_id FROM albums);

-- Exercise 7
-- Connect to the ls_burger database. Return a list of all orders and their associated product items.
SELECT orders.id, products.product_name FROM orders
INNER JOIN order_items ON (orders.id = order_items.order_id)
INNER JOIN products ON (order_items.product_id = products.id);

-- Exercise 8
-- Return the id of any order that includes Fries. Use table aliasing in your query.
SELECT DISTINCT o.id FROM orders AS o
INNER JOIN order_items AS oi ON (o.id = oi.order_id)
INNER JOIN products AS p ON (oi.product_id = p.id)
WHERE (p.product_name LIKE '%Fries%');

-- Exercise 9
-- Build on the query from the previous question to return the name of any customer who ordered fries.
-- Return this in a column called 'Customers who like Fries'. Don't repeat the same customer name more than once in the results.
SELECT DISTINCT c.customer_name AS "Customers who like Fries" FROM customers AS c
INNER JOIN orders AS o ON (c.id = o.customer_id)
INNER JOIN order_items AS oi ON (o.id = oi.order_id)
INNER JOIN products AS p ON (oi.product_id = p.id)
WHERE (p.product_name LIKE '%Fries%');

-- Exercise 10
-- Write a query to return the total cost of Natasha O'Shea's orders.
SELECT sum(p.product_cost) AS "Total cost of Natasha O'Shea's orders" FROM products AS p
INNER JOIN order_items AS oi ON (p.id = oi.product_id)
INNER JOIN orders AS o ON (oi.order_id = o.id)
INNER JOIN customers AS c ON (o.customer_id = c.id)
WHERE (c.customer_name LIKE 'Natasha O''Shea');

-- Launch School Solution
SELECT sum(p.product_cost) FROM customers AS c
JOIN orders as o ON c.id = o.customer_id
JOIN order_items AS oi ON o.id = oi.order_id
JOIN products AS p ON oi.product_id = p.id
WHERE c.customer_name = 'Natasha O''Shea';

-- Exercise 11
-- Write a query to return the name of every product included in an order alongside the number of times it has been ordered.
SELECT p.product_name, count(p.id) FROM products AS p
INNER JOIN order_items AS oi ON (p.id = oi.product_id)
GROUP BY p.product_name;
