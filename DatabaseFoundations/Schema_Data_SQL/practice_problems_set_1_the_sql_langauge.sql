-- 1.  What kind of language is SQL?

-- Answer:
-- Declarative, the actual answer is "special purpose language"
-- as it is only used for interacting with relational databases.
-- 2.  What are the 3 sublanguages of SQL?

-- Answer:
/*
1.  DDL - Data Definition Language
2.  DML - Data Manipulation Language
3.  DCL - Data Control Lanaguage
*/

/*
-- 3.  Write the following values as quoted string values
that could be used in a SQL query.

canoe
a long road
weren't
"No way!"
*/

-- Answer
SELECT 'canoe' AS "Test";
SELECT 'A long road' AS "Test";
SELECT 'weren''t' AS "Test";
SELECT '"No way!"';

-- 4.  What operator is used to concatenate strings?

-- Answer
SELECT concat('foo', ' ', 'bar') AS "Test";
SELECT 'foo' || ' ' || 'bar' AS "Test";
-- returns foo bar

-- 5.  What function returns a lowercased version of a string?
-- Write a SQL statement using it.

-- Answer
SELECT lower('FOO') AS "Test";
-- returns foo

-- 6.  How does the psql console display true and false values?
SELECT true AS "Test"; -- displays t
SELECT FALSE AS "Test"; -- displays f

/*
-- 7.  The surface area of a sphere is calculated using the formula A = 4π r2,
where A is the surface area and r is the radius of the sphere.

Use SQL to compute the surface area of a sphere with a radius of 26.3cm,
truncated to return an integer.
*/
SELECT trunc(4*pi()*26.3^2) AS "Test";

