/*
Exercise 2

Write the SQL statement needed to create a join table that will allow
a film to have multiple directors, and directors to have multiple films.
Include an id column in this table, and add foreign key constraints to
the other columns.
*/
CREATE TABLE directors_films (
	id SERIAL PRIMARY KEY,
	director_id INTEGER REFERENCES directors(id),
	film_id INTEGER REFERENCES films(id)
);

/*
Exercise 3

Write the SQL statements needed to insert data into the new join table to
represent the existing one-to-many relationships.
*/
INSERT INTO directors_films (film_id, director_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 3),
(8, 7),
(9, 8),
(10, 4);

/*
Exercise 4

Write a SQL statement to remove any unneeded columns from films.
*/
ALTER TABLE films DROP COLUMN director_id;

/*
Exercise 5

Write a SQL statement that will return the following result:

           title           |         name
---------------------------+----------------------
 12 Angry Men              | Sidney Lumet
 1984                      | Michael Anderson
 Casablanca                | Michael Curtiz
 Die Hard                  | John McTiernan
 Let the Right One In      | Michael Anderson
 The Birdcage              | Mike Nichols
 The Conversation          | Francis Ford Coppola
 The Godfather             | Francis Ford Coppola
 Tinker Tailor Soldier Spy | Tomas Alfredson
 Wayne's World             | Penelope Spheeris
(10 rows)
*/
SELECT f.title, d.name AS directory
FROM films AS f
INNER JOIN directors_films AS df
ON f.id = df.film_id
INNER JOIN directors AS d
ON df.director_id = d.id
ORDER BY f.title ASC;

/*
Exercise 6

Write SQL statements to insert data for the following films into the database:

Film					Year	Genre	Duration	Directors
Fargo					1996	comedy	98			Joel Coen
No Country for Old Men	2007	western	122			Joel Coen, Ethan Coen
Sin City				2005	crime	124			Frank Miller, Robert Rodriguez
Spy Kids				2001	scifi	88			Robert Rodriguez
*/
INSERT INTO directors (name) VALUES
('Joel Coen'),
('Ethan Coen'),
('Frank Miller'),
('Robert Rodriguez');

INSERT INTO films (title, year, genre, duration) VALUES
('Fargo', 1996, 'comedy', 98),
('No Country for Old Men', 2007, 'western', 122),
('Sin City', 2005, 'crime', 124),
('Spy Kids', 2001, 'scifi', 88);

INSERT INTO directors_films (film_id, director_id) VALUES
(11, 9),
(12, 9),
(12, 10),
(13, 11),
(13, 12),
(14, 12);

-- now to check I got it correct:
SELECT f.title AS "film", f.year, f.genre, f.duration, string_agg(d.name, ', ') AS "directors"
FROM films AS f
INNER JOIN directors_films AS df
ON f.id = df.film_id
INNER JOIN directors AS d
ON df.director_id = d.id
WHERE f.id BETWEEN 11 AND 14
GROUP BY f.title, f.year, f.genre, f.duration
ORDER BY f.title;
-- it worked!!

/*
Exercise 7

Write a SQL statement that determines how many films each director in the database has directed.
Sort the results by number of films (greatest first) and then name (in alphabetical order).

Output should be:

       director       | films
----------------------+-------
 Francis Ford Coppola |     2
 Joel Coen            |     2
 Michael Anderson     |     2
 Robert Rodriguez     |     2
 Ethan Coen           |     1
 Frank Miller         |     1
 John McTiernan       |     1
 Michael Curtiz       |     1
 Mike Nichols         |     1
 Penelope Spheeris    |     1
 Sidney Lumet         |     1
 Tomas Alfredson      |     1
(12 rows)
*/
SELECT d.name AS "director", count(df.film_id) AS "films"
FROM directors AS d
INNER JOIN directors_films AS df
ON d.id = df.director_id
GROUP BY d.name
ORDER BY "films" DESC, "director";



