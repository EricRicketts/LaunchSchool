-- Exercise 1
-- What is the result of using an operator on a NULL value?
-- A NULL value is returned

/*
Exercise 2

Set the default value of column department to "unassigned".
Then set the value of the department column to "unassigned" for
any rows where it has a NULL value. Finally, add a NOT NULL
constraint to the department column.
*/
ALTER TABLE employees ALTER COLUMN department SET DEFAULT 'unassigned';
UPDATE employees SET department = 'unassigned' WHERE first_name = 'Haiden' AND last_name = 'Smith';
-- actually the above is incorrect, it works but that is only
-- because I knew of all the data in the table before hand
UPDATE employees SET department = 'unassigned' WHERe department IS NULL;
ALTER TABLE employees ALTER COLUMN department SET NOT NULL;

/*
Exercise 3

Write the SQL statement to create a table called temperatures to hold the following data:

date            low     high
2016-03-01      34      43
2016-03-02      32      44
2016-03-03      31      47
2016-03-04      33      42
2016-03-05      39      46
2016-03-06      32      43
2016-03-07      29      32
2016-03-08      23      31
2016-03-09      17      28

Keep in mind that all rows in the table should always contain all three values.
*/
CREATE TABLE temperatures (
  "date" DATE NOT NULL,
  low INTEGER NOT NULL,
  high INTEGER NOT NULL
);

-- Exercise 4
-- Write the SQL statements needed to insert the data shown in #3 into the temperatures table.
INSERT INTO temperatures VALUES
('2016-03-01', 34, 43),
('2016-03-02', 32, 44),
('2016-03-03', 31, 47),
('2016-03-04', 33, 42),
('2016-03-05', 39, 46),
('2016-03-06', 32, 43),
('2016-03-07', 29, 32),
('2016-03-08', 23, 31),
('2016-03-09', 17, 28);

/*
Exercise 5

Write a SQL statement to determine the average (mean) temperature for the days from March 2, 2016
through March 8, 2016. Make sure that average values are decimals rounded to one decimal place.
*/
SELECT "date", round((low + high)/2.0, 1) AS average FROM temperatures
WHERE "date" BETWEEN '2016-03-02' AND '2016-03-08';

/*
Exercise 6

Write a SQL statement to add a new column, rainfall, to the temperatures table. It should store
millimeters of rain as integers and have a default value of 0.
*/
ALTER TABLE temperatures ADD COLUMN rainfall INTEGER DEFAULT 0;

/*
Exercise 7
Each day, it rains one millimeter for every degree the average temperature goes above 35.
Write a SQL statement to update the data in the table temperatures to reflect this.
*/
UPDATE temperatures SET rainfall = floor(round((low + high)/2.0 - 35.0, 1)) WHERE round((low + high)/2.0, 1) > 35.0;
-- Launch School solution uses only integers which makes things more readable
UPDATE temperatures SET rainfall = (high + low) / 2 - 35 WHERE (high + low) / 2 > 35;

/*
Exercise 8

A decision has been made to store rainfall data in inches.
Write the SQL statements required to modify the rainfall column to reflect these new requirements.
*/
ALTER TABLE temperatures ALTER COLUMN rainfall TYPE DECIMAL(6, 3);
UPDATE temperatures SET rainfall = rainfall/25.4 WHERE rainfall > 0.00;

-- Exercise 9
-- Write a SQL statement that renames the temperatures table to weather.
ALTER TABLE temperatures RENAME TO weather;

-- Exercise 10
-- What psql meta command shows the structure of a table? Use it to describe the structure of weather.
-- \d weather

/*
Exercise 11

What PostgreSQL program can be used to create a SQL file that contains the SQL commands needed
to recreate the current structure and data of the weather table?
*/
CREATE TABLE weather_backup AS TABLE weather;
ALTER TABLE weather_backup ALTER COLUMN rainfall SET DEFAULT 0;
ALTER TABLE weather_backup
ALTER COLUMN "date" SET NOT NULL,
ALTER COLUMN low SET NOT NULL,
ALTER COLUMN high SET NOT NULL;

/*
Launch School did it all on the command line, I guess I was too lazy to look it up.  The pg_dump command
enables a user to extract both the structure and data of a database and put it into a file.  Then this
file can be used to recreate the database or with some slight alterations create a new database with the
same structure and data as the previous one.

pg_dump -d sql-course -t weather --inserts > dump.sql
*/