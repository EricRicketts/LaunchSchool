-- Exercise 1:
-- Make sure you are connected to the encyclopedia database. Write a query to retrieve the population of the USA.
SELECT population FROM countries WHERE name = 'USA';

-- Exercise 2:
-- Write a query to return the population and the capital (with the results such that population is listed first followed by capitals) of all the countries in the table.
SELECT population, capital FROM countries;

-- Exercise 3:
-- Write a query to return the names of all the countries ordered alphabetically.
SELECT name FROM countries ORDER BY name;

-- Exercise 4:
-- Write a query to return the names and the capitals of all the countries in order of population, from lowest to highest.
SELECT name, capital FROM countries ORDER BY population;

-- Exercise 5:
-- Write a query to return the same information as the previous query, but ordered from highest to lowest.
SELECT name, capital FROM countries ORDER BY population DESC;

/*
Exercise 6:
Write a query on the animals table, using ORDER BY, that will return the following output:

       name       |      binomial_name       | max_weight_kg | max_age_years
------------------+--------------------------+---------------+---------------
 Peregrine Falcon | Falco Peregrinus         |        1.5000 |            15
 Pigeon           | Columbidae Columbiformes |        2.0000 |            15
 Dove             | Columbidae Columbiformes |        2.0000 |            15
 Golden Eagle     | Aquila Chrysaetos        |        6.3500 |            24
 Kakapo           | Strigops habroptila      |        4.0000 |            60
(5 rows)
Use only the columns that can be seen in the above output for ordering purposes.
*/
SELECT name, binomial_name, max_weight_kg, max_age_years FROM animals ORDER BY max_age_years, max_weight_kg, name DESC;

-- Exercise 7:
-- Write a query that returns the names of all the countries with a population greater than 70 million.
SELECT name FROM countries WHERE population > 70000000;

-- Exercise 8:
-- Write a query that returns the names of all the countries with a population greater than 70 million but less than 200 million.
SELECT name FROM countries WHERE population > 70000000 AND population < 200000000;

-- Exercise 9:
-- Write a query that will return the first name and last name of all entries in the celebrities table where the value of the deceased column is not true.
SELECT first_name, last_name FROM celebrities WHERE deceased != TRUE;

-- Exercise 10:
-- Write a query that will return the first and last names of all the celebrities who sing.
SELECT first_name, last_name FROM celebrities WHERE occupation LIKE '%Singer%';

-- Exercise 11:
-- Write a query that will return the first and last names of all the celebrities who act.
SELECT first_name, last_name FROM celebrities WHERE occupation LIKE '%Act%';

-- Exercise 12:
-- Write a query that will return the first and last names of all the celebrities who both sing and act.
SELECT first_name, last_name FROM celebrities WHERE (occupation LIKE '%Singer%' AND occupation LIKE '%Act%');

-- Exercise 13:
-- Connect to the ls_burger database. Write a query that lists all of the burgers that have been ordered,
-- from cheapest to most expensive, where the cost of the burger is less than $5.00.
SELECT burger FROM orders WHERE burger_cost < 5.00 ORDER BY burger_cost;

-- Exercise 14:
-- Write a query to return the customer name and email address and loyalty points from any order worth 20 or
-- more loyalty points. List the results from the highest number of points to the lowest.
SELECT customer_name, customer_email, customer_loyalty_points FROM orders WHERE customer_loyalty_points >= 20 ORDER BY customer_loyalty_points DESC;

-- Exercise 15:
-- Write a query that returns all the burgers ordered by Natasha O'Shea.
SELECT burger FROM orders WHERE customer_name = 'Natasha O''Shea';

-- Exercise 16:
-- Write a query that returns the customer name from any order which does not include a drink item.
SELECT customer_name FROM orders WHERE drink IS NULL;

-- Exercise 17:
-- Write a query that returns the three meal items for any order which does not include fries.
SELECT burger, side, drink FROM orders WHERE side != 'Fries' OR side IS NULL;

-- Exercise 18:
-- Write a query that returns the three meal items for any order that includes both a side and a drink.
SELECT burger, side, drink FROM orders WHERE (side IS NOT NULL and drink IS NOT NULL);


