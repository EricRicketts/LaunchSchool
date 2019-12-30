/*
Exercise 1

Setup Database

For this set of exercises we'll want to create a new database and some tables to work with.
The theme for the exercise is that of a workshop. Create a database to store information
and tables related to this workshop.

One table should be called devices. This table should have columns that meet the following specifications:

Includes a primary key called id that is auto-incrementing.
A column called name, that can contain a String. It cannot be NULL.
A column called created_at that lists the date this device was created.
It should be of type timestamp and it should also have a default value related to when a device is created.

In the workshop, we have several devices, and each device should have many different parts.
These parts are unique to each device, so one device can have various parts, but those parts
won't be used in any other device.

Make a table called parts that reflects the information listed above.
Table parts should have the following columns that meet the following specifications:

An id which auto-increments and acts as the primary key
A part_number. This column should be unique and not null.
A foreign key column called device_id. This will be used to associate various parts with a device.
*/
CREATE TABLE devices (
	id SERIAL PRIMARY KEY,
	"name" text NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE parts (
	id SERIAL PRIMARY KEY,
	part_number INTEGER UNIQUE NOT NULL,
	device_id INTEGER REFERENCES devices(id)
);

/*
Exercise 2

Insert Data for parts and devices

Now that we have the infrastructure for our workshop set up, let's start adding in some data.
Add in two different devices. One should be named, "Accelerometer". The other should be named, "Gyroscope".

The first device should have 3 parts (this is grossly simplified). The second device should have 5 parts.
The part numbers may be any number between 1 and 10000. There should also be 3 parts that don't belong to any device yet.
*/
INSERT INTO devices ("name") VALUES
('Accelerometer'), ('Gyroscope');

INSERT INTO parts (part_number, device_id) VALUES
(100, 1),
(101, 1),
(102, 1),
(200, 2),
(201, 2),
(202, 2),
(203, 2),
(204, 2),
(300, NULL),
(301, NULL),
(302, NULL);

/*
Exercise 3

INNER JOIN

Write an SQL query to display all devices along with all the parts that make them up. We only want to display
the name of the devices. Its parts should only display the part_number.

Expected output:

     name      | part_number
---------------+-------------
 Accelerometer |          12
 Accelerometer |          14
 Accelerometer |          16
 Gyroscope     |          31
 Gyroscope     |          33
 Gyroscope     |          35
 Gyroscope     |          37
 Gyroscope     |          39
(8 rows)
*/
SELECT d.name, p.part_number
FROM devices AS d
INNER JOIN parts AS p
ON d.id = p.device_id
GROUP BY d.name, p.part_number
ORDER BY d.name;
-- also
SELECT d.name, p.part_number
FROM devices AS d
INNER JOIN parts AS p
ON d.id = p.device_id
ORDER BY d.name;

/*
Exercise 4

SELECT part_number

We want to grab all parts that have a part_number that starts with 3.
Write a SELECT query to get this information. This table may show all
attributes of the parts table.
*/
SELECT *
FROM parts
WHERE part_number::text LIKE '3%';
-- Launch School wanted the Gryroscopes
-- since the part number began with 3
-- in my case I can do the following:
SELECT *
FROM parts
WHERE part_number::text LIKE '2%';

/*
Exercise 5

Aggregate functions

Write an SQL query that returns a result table with the name of each
device in our database together with the number of parts for that device.
*/
SELECT d.name, count(p.id) AS "Number of Parts"
FROM devices AS d
INNER JOIN parts AS p
ON d.id = p.device_id
GROUP BY d.name;
/*
the GROUP BY is needed because we group by
the device name and then within each group we
count the number of parts for each device
*/

/*
Exercise 6

ORDER BY

In the previous exercise, we had to use a GROUP BY clause to obtain the expected output.
In that exercise, we used an SQL query like:

SELECT devices.name AS name, COUNT(parts.device_id)
FROM devices
JOIN parts ON devices.id = parts.device_id
GROUP BY devices.name;

Now, we want to work with the same query, but we want to guarantee that the devices and the
count of their parts are listed in descending alphabetical order. Alter the SQL query above
so that we get a result table that looks like the following.

name          | count
--------------+-------
Gyroscope     |     5
Accelerometer |     3
(2 rows)
*/
SELECT d.name AS "Device Name", count(p.id) AS "Number of Parts"
FROM devices AS d
INNER JOIN parts AS p
ON d.id = p.device_id
GROUP BY "Device Name"
ORDER BY "Device Name" DESC;

/*
Exercise 7

IS NULL and IS NOT NULL

Write two SQL queries:

One that generates a listing of parts that currently belong to a device.
One that generates a listing of parts that don't belong to a device.
Do not include the id column in your queries.

Expected Output:

part_number | device_id
------------+-----------
         12 |         1
         14 |         1
         16 |         1
         31 |         2
         33 |         2
         35 |         2
         37 |         2
         39 |         2
(8 rows)

part_number | device_id
------------+-----------
         50 |
         54 |
         58 |
(3 rows)
*/
SELECT p.part_number, p.device_id
FROM parts AS p
WHERE p.device_id IS NOT NULL;

SELECT p.part_number, p.device_id
FROM parts AS p
WHERE p.device_id IS NULL;

/*
Exercise 8

Oldest device

Insert one more device into the devices table. You may use this SQL statement or create your own.

INSERT INTO devices (name) VALUES ('Magnetometer');
INSERT INTO parts (part_number, device_id) VALUES (42, 3);

Assuming nothing about the existing order of the records in the database, write an SQL statement
that will return the name of the oldest device from our devices table.
*/
INSERT INTO devices (name) VALUES ('Magnetometer');
INSERT INTO parts (part_number, device_id) VALUES
(400, 3),
(401, 3),
(402, 3),
(403, 3);

SELECT d.name AS "Oldest Device"
FROM devices AS d
ORDER BY d.created_at ASC
LIMIT 1;

/*
Exericse 9

UPDATE device_id

We've realized that the last two parts we're using for device number 2, "Gyroscope", actually belong to an
"Accelerometer". Write an SQL statement that will associate the last two parts from our parts table with an
"Accelerometer" instead of a "Gyroscope".
*/
UPDATE parts SET device_id = 1 WHERE part_number = 203 OR part_number = 204;
UPDATE parts SET device_id = 1 WHERE part_number = (SELECT min(part_number) FROM parts);

/*
Exercise 10

Delete Accelerometer

Our workshop has decided to not make an Accelerometer after all. Delete any data related to "Accelerometer",
this includes the parts associated with an Accelerometer.
*/
DELETE FROM parts WHERE device_id = 1;
DELETE FROM devices WHERE id = 1;

