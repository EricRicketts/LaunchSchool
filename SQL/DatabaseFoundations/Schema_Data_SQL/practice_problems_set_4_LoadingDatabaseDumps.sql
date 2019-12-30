/*
Exercise 1

Load this file into your database.

a. What does the file do?

b. What is the output of the command? What does each line in this output mean?

c. Open up the file and look at its contents. What does the first line do?
*/
-- I copied the conent of the link into database_data_dump.sql
-- a.  The file does the following:
--	   1.  It first drops the table "films" if it exists from any public database
--	   2.  It then creates a table "films" with three columns title, year, and genre
--	   3.  It then inserts data into the table, 3 rows worth
-- b. output was:
/*
psql:/Users/ericricketts/Documents/LaunchSchool/DatabaseFoundations/Schema_Data_SQL/database_data_dump.sql:1: NOTICE:  table "films" does not exist, skipping
DROP TABLE
CREATE TABLE
INSERT 0 1
INSERT 0 1
INSERT 0 1

-- first line, not films table exists so DROP TABLE command was skipped
-- second line, table "films" was created
-- lines 3 - 5, an insert command for each of the three records
*/

-- Exercise 2
-- Write a SQL statement that returns all rows in the films table.
SELECT * FROM films;

-- Exercise 3
-- Write a SQL statement that returns all rows in the films table with a title shorter than 12 letters.
SELECT * FROM films WHERE length(title) < 12;

/*
Exercise 4

Write the SQL statements needed to add two additional columns to the films table: director,
which will hold a director's full name, and duration, which will hold the length of the film in minutes.
*/
ALTER TABLE films
ADD COLUMN director VARCHAR(100),
ADD COLUMN duration INTEGER;

/*
Exercise 5

Write SQL statements to update the existing rows in the database with values for the new columns:

title				director				duration
Die Hard			John McTiernan			132
Casablanca			Michael Curtiz			102
The Conversation	Francis Ford Coppola	113
*/
UPDATE films SET director = 'John McTiernan', duration = 132 WHERE title = 'Die Hard';
UPDATE films SET director = 'Michael Curtiz', duration = 102 WHERE title = 'Casablanca';
UPDATE films SET director = 'Francis Ford Coppola', duration = 113 WHERE title = 'The Conversation';

/*
Exercise 6

Write SQL statements to insert the following data into the films table:

title						year	genre		director			duration
1984						1956	scifi		Michael Anderson	90
Tinker Tailor Soldier Spy	2011	espionage	Tomas Alfredson		127
The Birdcage				1996	comedy		Mike Nichols		118
*/
INSERT INTO films VALUES
('1984', 1956, 'scifi', 'Michael Anderson', 90),
('Tinker Tailor Soldier Spy', 2011, 'espionage', 'Tomas Alfredson', 127),
('The Birdcage', 1996, 'comedy', 'Mike Nichols', 118);

/*
Exercise 7

Write a SQL statement that will return the title and age in years of each movie, with newest movies listed first:
*/
SELECT title, date_part('year', NOW()) - "year" AS age FROM films ORDER BY age ASC;

/*
Exercise 8

Write a SQL statement that will return the title and duration of each movie longer than two hours, with the longest movies first.
*/
SELECT title, duration FROM films WHERE duration > 120 ORDER BY duration DESC;

-- Exercise 9
-- Write a SQL statement that returns the title of the longest film.
SELECT title FROM films ORDER BY duration DESC LIMIT 1;
