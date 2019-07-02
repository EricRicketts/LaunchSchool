-- Exercise 1
-- Import this file into a PostgreSQL database.
-- two ways to do it
-- from psql console and in the launch_school database:
-- launch_school=# \i ~/Documents/LaunchSchool/DatabaseFoundations/Schema_Data_SQL/ls_films.sql
-- from the Unix command line: psql -d launch_school < ls_films.sql

-- Exercise 2
-- Modify all of the columns to be NOT NULL.
ALTER TABLE films
ALTER COLUMN title SET NOT NULL,
ALTER COLUMN "year" SET NOT NULL,
ALTER COLUMN genre SET NOT NULL,
ALTER COLUMN director SET NOT NULL,
ALTER COLUMN duration SET NOT NULL;

/*
Exercise 3

How does modifying a column to be NOT NULL affect how it is displayed by \d films?

by each column showing up as non null in the Nullable column
launch_school=# \d films

                        Table "public.films"
  Column  |          Type          | Collation | Nullable | Default
----------+------------------------+-----------+----------+---------
 title    | character varying(255) |           | not null |
 year     | integer                |           | not null |
 genre    | character varying(100) |           | not null |
 director | character varying(255) |           | not null |
 duration | integer                |           | not null |
*/

-- Exercise 4
-- Add a constraint to the table films that ensures that all films have a unique title.
ALTER TABLE films ADD UNIQUE(title);
ALTER TABLE films DROP CONSTRAINT films_title_key; -- drop the constraint so I can name my own
ALTER TABLE films ADD CONSTRAINT film_titles_unique UNIQUE(title); -- add constraint with name

-- Exercise 5
-- How is the constraint added in #4 displayed by \d films?
/*
the constraints are listed at the bottom of the table schema

                        Table "public.films"
  Column  |          Type          | Collation | Nullable | Default
----------+------------------------+-----------+----------+---------
 title    | character varying(255) |           | not null |
 year     | integer                |           | not null |
 genre    | character varying(100) |           | not null |
 director | character varying(255) |           | not null |
 duration | integer                |           | not null |
Indexes:
    "film_titles_unique" UNIQUE CONSTRAINT, btree (title)
*/

-- Exercise 6
-- Write a SQL statement to remove the constraint added in #4.
ALTER TABLE films DROP CONSTRAINT film_titles_unique;

-- Exercise 7
-- Add a constraint to films that requires all rows to have a value for title that is at least 1 character long.
ALTER TABLE films ADD CHECK (length(trim(title)) >= 1 );
ALTER TABLE films DROP CONSTRAINT films_title_check; -- drop the check to name it
ALTER TABLE films ADD CONSTRAINT films_title_length_check CHECK (length(trim(title)) >= 1);

-- Exercise 8
-- What error is shown if the constraint created in #7 is violated? Write a SQL INSERT
-- statement that demonstrates this.
INSERT INTO films VALUES (' ', 1934, 'scifi', 'foo', 100);
-- An error would occur showing the films title check has been violated
/*
ERROR:  new row for relation "films" violates check constraint "films_title_length_check"
DETAIL:  Failing row contains ( , 1934, scifi, foo, 100).
*/

-- Exercise 9
-- How is the constraint added in #7 displayed by \d films?
/*
it is listed along with other constraints at the bottom of the table schema

                        Table "public.films"
  Column  |          Type          | Collation | Nullable | Default
----------+------------------------+-----------+----------+---------
 title    | character varying(255) |           | not null |
 year     | integer                |           | not null |
 genre    | character varying(100) |           | not null |
 director | character varying(255) |           | not null |
 duration | integer                |           | not null |
Indexes:
    "film_titles_unique" UNIQUE CONSTRAINT, btree (title)
Check constraints:
    "films_title_length_check" CHECK (length(btrim(title::text)) >= 1)
*/

-- Exercise 10
-- Write a SQL statement to remove the constraint added in #7.
ALTER TABLE films DROP CONSTRAINT films_title_length_check;

-- Exercise 11
-- Add a constraint to the table films that ensures that all films have a year between 1900 and 2100.
ALTER TABLE films ADD CONSTRAINT film_year_check CHECK ("year" BETWEEN 1900 AND 2100);

-- Exercise 12
-- How is the constraint added in #11 displayed by \d films?
/*
It is displayed at the bottom of the table schema as a check constraint

                        Table "public.films"
  Column  |          Type          | Collation | Nullable | Default
----------+------------------------+-----------+----------+---------
 title    | character varying(255) |           | not null |
 year     | integer                |           | not null |
 genre    | character varying(100) |           | not null |
 director | character varying(255) |           | not null |
 duration | integer                |           | not null |
Indexes:
    "film_titles_unique" UNIQUE CONSTRAINT, btree (title)
Check constraints:
    "film_year_check" CHECK (year >= 1900 AND year <= 2100)
*/

/*
Exercise 13

Add a constraint to films that requires all rows to have a value for director that is at
least 3 characters long and contains at least one space character ().
*/
ALTER TABLE films ADD CONSTRAINT director_check CHECK (length(trim(director)) >= 3 AND trim(director) ~ '\w\s+\w');
-- Here is the Launch School Solution
ALTER TABLE films ADD CONSTRAINT director_name CHECK (length(director) >= 3 AND position(' ' in director) > 0);
-- I have a problem with it because you could have a space after a name and ti would pass -> 'Fred '
-- I think the intent was to check for a space between two or three words

-- Exercise 14
-- How does the constraint created in #13 appear in \d films?
-- It appears at the bottom of the table schema as a check constraint
/*
                        Table "public.films"
  Column  |          Type          | Collation | Nullable | Default
----------+------------------------+-----------+----------+---------
 title    | character varying(255) |           | not null |
 year     | integer                |           | not null |
 genre    | character varying(100) |           | not null |
 director | character varying(255) |           | not null |
 duration | integer                |           | not null |
Indexes:
    "film_titles_unique" UNIQUE CONSTRAINT, btree (title)
Check constraints:
    "director_check" CHECK (length(btrim(director::text)) >= 3 AND btrim(director::text) ~ '\w\s+\w'::text)
    "film_year_check" CHECK (year >= 1900 AND year <= 2100)
*/

-- Exercise 15
-- Write an UPDATE statement that attempts to change the director for "Die Hard" to "Johnny".
-- Show the error that occurs when this statement is executed.
UPDATE films SET director = 'Johnny' WHERE title = 'Die Hard';
/*
An error is thrown which shows the director constraint was violated

UPDATE films SET director = 'Johnny' WHERE title = 'Die Hard';
ERROR:  new row for relation "films" violates check constraint "director_check"
DETAIL:  Failing row contains (Die Hard, 1988, action, Johnny, 132).
*/

-- Exercise 16
-- List three ways to use the schema to restrict what values can be stored in a column.
/*
1.  ALTER TABLE table_name ALTER COLUMN column_name TYPE data_type
2.  ALTER TABLE table_name ADD CONSTRAINT constraint_name CHECK (expression)
3.  ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL;
*/

/*
Exercise 17

Is it possible to define a default value for a column that will be considered invalid by a constraint?
Create a table that tests this.
*/
CREATE TABLE test (
	id SERIAL UNIQUE,
	full_name VARCHAR(100) DEFAULT 'FooBar',
	CHECK (length(trim(full_name)) >= 3 AND trim(full_name) ~ '\w\s+\w')
);
-- this created the table but when I tried to insert using defaults, the constraint was violated
/*
INSERT INTO test VALUES (default, default);
ERROR:  new row for relation "test" violates check constraint "test_full_name_check"
DETAIL:  Failing row contains (1, FooBar).
*/

-- Exercise 18
-- How can you see a list of all of the constraints on a table?
-- \d $table_name
-- I was looking for something which we have not used as of yet.


