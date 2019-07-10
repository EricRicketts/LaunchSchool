/*
Exercise 1

Write a SQL statement to add the following call data to the database:

when					duration	first_name		last_name		number
2016-01-18 14:47:00		632			William			Swift			7204890809
*/
INSERT INTO calls ("when", duration, contact_id)
VALUES ('2016-01-18 14:47:00', 632, 6);

/*
Exercise 2

Write a SQL statement to retrieve the call times, duration,
and first name for all calls not made to William Swift.
*/
SELECT ca.when, ca.duration, con.first_name
FROM calls AS ca
INNER JOIN contacts AS con
ON ca.contact_id = con.id
WHERE con.first_name != 'William' AND con.last_name != 'Swift';

/*
Exercise 3

Write SQL statements to add the following call data to the database:

when					duration	first_name	last_name	number
2016-01-17 11:52:00		175			Merve		Elk			6343511126
2016-01-18 21:22:00		79			Sawa		Fyodorov	6125594874
*/
INSERT INTO contacts (first_name, last_name, number) VALUES
('Merve', 'Elk', '6343511126'),
('Sawa', 'Fyodorov', '6125594874');

-- now we need to the contacts id
SELECT id, first_name, last_name
FROM contacts
WHERE (first_name = 'Merve' AND last_name = 'Elk')
OR
(first_name = 'Sawa' AND last_name = 'Fyodorov');

INSERT INTO calls ("when", duration, contact_id) VALUES
('2016-01-17 11:52:00', 175, 26),
('2016-01-18 21:22:00', 79, 27);

/*
Exercise 4

Add a constraint to contacts that prevents a duplicate value being added
in the column number.
*/
ALTER TABLE contacts ADD CONSTRAINT unique_number UNIQUE(number);

/*
Exercise 5

Write a SQL statement that attempts to insert a duplicate number for a
new contact but fails. What error is shown?
*/
INSERT INTO contacts (first_name, last_name, number) VALUES
('Foo', 'Bar', (SELECT number FROM contacts WHERE id = 6));
-- above worked!!
-- it violates the UNIQUE constraint for the number
/*
ERROR:  duplicate key value violates unique constraint "unique_number"
DETAIL:  Key (number)=(7204890809) already exists.
*/

/*
Exercise 6

Why does "when" need to be quoted in many of the queries in this lesson?

Looking at the PostgreSQL documentation WHEN is both a PostgreSQL
keyword and an SQL keyword
*/

/*
Exercise 7

Draw an entity-relationship diagram for the data we've been working with in this assignment.

contacts									calls
id serial primary key 						id serial primary key
first_name text not null					when timestamp without timezone not null
last_name text not null						duration integer not null
number varchar(10) not null unique 			contact_id integer not null foreign key references contacts(id)

simply put
one contact can have many calls
*/

