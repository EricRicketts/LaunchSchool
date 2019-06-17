/*
These exercises are based on setting up the database ls_burger.  There is an sql file
in the DatabaseFoundations/IntroductionToSQL/SQLBasicsTutorial that sets up the "orders"
table within the ls_burger database.
*/

-- Exercise 1: Write a query that returns all of the customer names from the orders table.
SELECT customer_name FROM orders;

-- Exercise 2: Write a query that returns all of the orders that include a Chocolate Shake.
SELECT * FROM orders WHERE drink = 'Chocolate Shake';

-- Exercise 3: Write a query that returns the burger, side, and drink for the order with an id of 2.
SELECT burger, side, drink FROM orders WHERE id = 2;

-- Exercise 4: Write a query that returns the name of anyone who ordered Onion Rings.
SELECT customer_name FROM orders WHERE side = 'Onion Rings';