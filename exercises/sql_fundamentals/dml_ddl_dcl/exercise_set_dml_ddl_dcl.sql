/*
-- Exercise 1

SQL consists of 3 different sublanguages. For example, one of these sublanguages
is called the Data Control Language (DCL) component of SQL. It is used to control
access to a database; it is responsible for defining the rights and roles granted
to individual users. Common SQL DCL statements include:

GRANT
REVOKE
*/

-- Answer
-- DDL - Data Definition Language: It is used to create, modify, and delete the
-- schema (structure) stored in the database.
-- Examples include CREATE TABLE, ALTER TABLE

-- DML - Data Manipulation Language: It is used to create, read, update, and delete
-- the data stored in the database.
-- Examples include SELECT, INSERT INTO

/*
-- Exercise 2

Does the following statement use the Data Definition Language (DDL) or
the Data Manipulation Language (DML) component of SQL?
*/
SELECT column_name FROM my_table; -- this is a Read operation on data -> DML

/*
-- Exercise 3

Does the following statement use the DDL or DML component of SQL?
*/
CREATE TABLE things (
  id serial PRIMARY KEY,
  item text NOT NULL UNIQUE,
  material text NOT NULL
);
-- DDL we are creating a database table which includes structural
-- requirements, but it does not manipulate any data

-- Exercise 4
-- Does the following statement use the DDL or DML component of SQL?
ALTER TABLE things
DROP CONSTRAINT things_item_key;
-- DDL - No data is being altered or queried, the structure of the
-- table is being modified.

-- Exercise 5
-- Does the following statement use the DDL or DML component of SQL?
INSERT INTO things VALUES (3, 'Scissors', 'Metal');
-- DML - this statement modifies the actual data contained in the database

-- Exercise 6
-- Does the following statement use the DDL or DML component of SQL?
UPDATE things
SET material = 'plastic'
WHERE item = 'Cup';
-- DML - this statement modifies the actual data of the database, not
-- its underlying structure

-- Exercise 7
-- Does the following statement use the DDL, DML, or DCL component of SQL?
-- \d things
-- DML - though it shows the schema of table "things" it is actually not
-- creating or modifying the structure of the database

-- I got this one wrong, the answer is neither as \d is part of the psql
-- application and not part of the SQL language standard.  As a matter
-- of fact I got it wrong on both accounts, as the Launch School answer
-- said it would be closer to DDL than DML as it lists the schema of
-- the table.

-- Exercise 8
DELETE FROM things WHERE item = 'Cup';
-- DML - this is deleting actual data from the database, not
-- chaning the underlying structure

-- Exercise 9
-- Does the following statement use the DDL or DML component of SQL?
DROP DATABASE xyzzy;
-- DDL and DML - I would say both as the entire database is removed
-- both its structure and data.

-- Launch School states it is DDL, which I disagree with, but they
-- are correct in that DROP is typicallyi associated with DDL, however
-- both data and structure are removed.  I will go with DDL since that
-- is the answer they require.

-- Exercise 10
-- Does the following statement use the DDL or DML component of SQL?
CREATE SEQUENCE part_number_sequence;
-- DDL - it is adding structure to the database framework, the sequence
-- has not been populated with data yet.