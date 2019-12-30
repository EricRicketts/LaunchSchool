-- Exercise 1
-- Create a new database called residents using the PostgreSQL command line tools.
-- createdb residents

-- Exercise 2
-- Load this file into the database created in #1.
-- I created the file more_single_data_queries.sql and
-- copied the Launch School content into it.
-- psql -d residents < more_single_data_queries.sql

/*
Output was:

SET
SET
SET
SET
SET
SET
SET
ERROR:  relation "public.people" does not exist
ERROR:  relation "public.people" does not exist
ERROR:  sequence "people_id_seq" does not exist
ERROR:  table "people" does not exist
DROP EXTENSION
DROP SCHEMA
CREATE SCHEMA
COMMENT
CREATE EXTENSION
COMMENT
SET
SET
SET
CREATE TABLE
CREATE SEQUENCE
ALTER SEQUENCE
ALTER TABLE
COPY 10000
 setval
--------
  10001
(1 row)

ALTER TABLE
*/

-- Exercise 3
-- Write a SQL query to list the ten states with the most rows in the people table in descending order.
SELECT state, count(state) AS count FROM people GROUP BY state ORDER BY count DESC LIMIT 10;

/*
Exercise 4

Write a SQL query that lists each domain used in an email address in the people table and how many people
in the database have an email address containing that domain. Domains should be listed with the most popular first.
*/
-- I could not solve this by myself I had to go to Stack Overflow
SELECT regexp_match(email, '(?<=@).*') AS domain, count(*) AS domain_count
FROM people
GROUP BY regexp_match(email, '(?<=@).*')
ORDER BY domain_count DESC, domain;

-- another one I came up with by messing around at the psql console:
-- did take a little from the Launch School solution, in this case count(id)
-- is the same as count(*) as it is counting the resulting rows
SELECT regexp_match(email, '(?<=@).*') AS domain, count(id) AS domain_count
FROM people
GROUP BY domain
ORDER BY domain_count DESC;

-- Exercise 5
-- Write a SQL statement that will delete the person with ID 3399 from the people table.
DELETE FROM people WHERE id = 3399;

-- Exercise 6
-- Write a SQL statement that will delete all users that are located in the state of California (CA).
DELETE FROM people WHERE state = 'CA';

-- Exercise 7
-- Write a SQL statement that will update the given_name values to be all uppercase
-- for all users with an email address that contains teleworm.us.
UPDATE people SET given_name = upper(given_name) WHERE email LIKE '%@teleworm.us%';

-- Exercise 8
-- Write a SQL statement that will delete all rows from the people table.
DELETE FROM people;