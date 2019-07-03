-- Exercise 1
-- Write a SQL statement that makes a new sequence called "counter".
CREATE SEQUENCE counter;

-- Exercise 2
-- Write a SQL statement to retrieve the next value from the sequence created in #1.
SELECT nextval('counter');

-- Exercise 3
-- Write a SQL statement that removes a sequence called "counter".
DROP SEQUENCE counter;

-- Exercise 4
-- Is it possible to create a sequence that returns only even numbers?
CREATE SEQUENCE even_counter START WITH 2 INCREMENT BY 2;

-- Exercise 5
-- What will the name of the sequence created by the following SQL statement be?
-- CREATE TABLE regions (id serial PRIMARY KEY, name text, area integer);
-- regions_pkey; note this is different from the Launch School answer and it
-- could be because I am using a newer PostgreSQL release

-- Exercise 6
-- Write a SQL statement to add an auto-incrementing integer primary key column to the films table.
ALTER TABLE films ADD COLUMN id SERIAL PRIMARY KEY;

-- Exercise 7
-- What error do you receive if you attempt to update a row to have a
-- value for id that is used by another row?
INSERT INTO films (id, title, "year", genre, director, duration) VALUES
(1, 'FooBar', 1920, 'drama', 'Elmer Fudd', 90);
/*
It will violate the UNIQUE constraint on the key:

ERROR:  duplicate key value violates unique constraint "films_pkey"
DETAIL:  Key (id)=(1) already exists.
*/

-- Exercise 8
-- What error do you receive if you attempt to add another primary key column to the films table?
-- It would seem there can only be one primary key per table, so let's try
ALTER TABLE films ADD COLUMN new_id SERIAL PRIMARY KEY;
-- exactly as I thought
-- ERROR:  multiple primary keys for table "films" are not allowed

-- Exercise 9
-- Write a SQL statement that modifies the table films to remove its primary key
-- while preserving the id column and the values it contains.
ALTER TABLE films DROP CONSTRAINT films_pkey; -- this is a table constraint not a column constraint
-- to add the primary key constraint back in:
ALTER TABLE films ADD PRIMARY KEY (id);
-- you do it this way because the primary key is a table wide constraint