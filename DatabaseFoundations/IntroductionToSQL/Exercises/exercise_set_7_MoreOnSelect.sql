-- Exercise 1
-- Make sure you are connected to the encyclopedia database.
-- Write a query to retrieve the first row of data from the countries table.
SELECT * FROM countries LIMIT 1;

-- Exercise 2
-- Write a query to retrieve the name of the country with the largest population.
SELECT name FROM countries ORDER BY population DESC LIMIT 1;

-- Exercise 3
-- Write a query to retrieve the name of the country with the second largest population.
SELECT name FROM countries ORDER BY population DESC LIMIT 1 OFFSET 1;

-- Exercise 4
-- Write a query to retrieve all of the unique values from the binomial_name column of the animals table.
SELECT DISTINCT binomial_name FROM animals;

-- Exercise 5
-- Write a query to return the longest binomial name from the animals table.
SELECT binomial_name FROM animals ORDER BY length(binomial_name) DESC LIMIT 1;

-- Exercise 6
-- Write a query to return the first name of any celebrity born in 1958.
SELECT first_name FROM celebrities WHERE date_part('year', date_of_birth) = 1958;

-- Exercise 7
-- Write a query to return the highest maximum age from the animals table.
SELECT max(max_age_years) FROM animals;

-- Exercise 8
-- Write a query to return the average maximum weight from the animals table.
SELECT avg(max_weight_kg) FROM animals;

-- Exercise 9
-- Write a query to return the number of rows in the countries table.
SELECT count(id) FROM countries;

-- Exercise 10
-- Write a query to return the total population of all the countries in the countries table.
SELECT sum(population) FROM countries;

-- Exercise 11
-- Write a query to return each unique conservation status code alongside the number of animals that have that code.
SELECT DISTINCT conservation_status, count(conservation_status) FROM animals GROUP BY conservation_status;
-- to make highest first
SELECT DISTINCT conservation_status, count(conservation_status) FROM animals GROUP BY conservation_status ORDER BY count(conservation_status) DESC;
-- Launch School Solution
SELECT conservation_status, count(id) FROM animals GROUP BY conservation_status;

-- Exercise 12
-- Connect to the ls_burger database. Write a query that returns the average burger cost for all orders that include fries.
SELECT avg(burger_cost) FROM orders WHERE side='Fries';

-- Exercise 13
-- Write a query that returns the cost of the cheapest side ordered.
SELECT min(side_cost) FROM orders WHERE side_cost > 0.00;
-- Launch School Solution
SELECT min(side_cost) FROM orders WHERE side IS NOT NULL;

-- Exercise 14
-- Write a query that returns the number of orders that include Fries and the number of orders that include Onion Rings.
SELECT side, count(side) FROM orders WHERE side='Fries' OR side='Onion Rings' GROUP BY side;