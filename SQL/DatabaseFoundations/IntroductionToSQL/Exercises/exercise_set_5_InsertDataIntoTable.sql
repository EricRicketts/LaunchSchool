/*
Exercise 1
Make sure you are connected to the encyclopedia database. Add the following data to the countries table:

Name	Capital	Population
France	Paris	67,158,000

*/
INSERT INTO countries (name, capital, population) VALUES ('France', 'Paris', 67158000);

/*
Exercise 2
Now add the following additional data to the countries table:

Name	Capital	Population
USA	Washington D.C.	325,365,189
Germany	Berlin	82,349,400
Japan	Tokyo	126,672,000
*/
INSERT INTO countries (name, capital, population) VALUES
('USA', 'Washington D.C.', 325365189),
('Germany', 'Berlin', 82349400),
('Japan', 'Tokyo', 126672000);

/*
Exercise 3
Add an entry to the celebrities table for the singer and songwriter Bruce Springsteen,
who was born on September 23rd 1949 and is still alive.
*/
INSERT INTO celebrities (first_name, occupation, date_of_birth, deceased, last_name)
VALUES ('Bruce', 'Singer, Songwriter', '09-23-1949', FALSE, 'Springsteen');

/*
Exercise 4
Add an entry for the actress Scarlett Johansson, who was born on November 22nd 1984.
Use the default value for the deceased column.
*/
INSERT INTO celebrities (first_name, last_name, occupation, date_of_birth)
VALUES ('Scarlett', 'Johansson', 'Actress', '11-22-1984');

/*
Exercise 5
Add the following two entries to the celebrities table with a single INSERT statement.
For Frank Sinatra set true as the value for the deceased column.
For Tom Cruise, don't set an explicit value for the deceased column, but use the default value.

First Name	Last Name	     Occupation	  D.O.B.
Frank	    Sinatra	Singer,  Actor	      December 12, 1915
Tom	        Cruise	         Actor	      July 03, 1962
*/
INSERT INTO celebrities (first_name, last_name, occupation, date_of_birth, deceased)
VALUES
('Frank', 'Sinatra', 'Actor', '12-12-1915', true),
('Tom', 'Cruise', 'Actor', '07-02-1962', DEFAULT);

/*
Exercise 6
Look at the schema of the celebrities table. What do you think will happen if we try to insert the following data?

First Name	Last Name	Occupation								D.O.B.			Deceased
Madonna					Singer, Actress							'08/16/1958'	false
Prince					Singer, Songwriter, Musician, Actor		'06/07/1958'	true

If we try to insert without a Last Name we will get an error, because the schema calls for
last_name to be NOT NULL.  The date format should be fine.
*/

/*
Exercise 7
Update the last_name column of the celebrities table so that the data in the previous question can be entered,
and then add the data to the table.

Madonna Louise Ciccone
Prince Rogers Nelson
*/
INSERT INTO celebrities (first_name, last_name, occupation, date_of_birth, deceased)
VALUES ('Madonna', 'Louise Ciccone', 'Singer, Actress', '08/16/1958', DEFAULT),
('Prince', 'Rogers Nelson', 'Singer, Songwriter, Musician, Actor', '06/07/1958', true);

/*
Exercise 8
Check the schema of the celebrities table. What would happen if we specify a NULL value for deceased column, such as with the data below?

First Name	Last Name		Occupation					D.O.B.			Deceased
Elvis		Presley			Singer, Musican, Actor		01/08/1935'		NULL

It will actually accept the NULL value because there is no NOT NULL constraint on the column
*/
INSERT INTO celebrities (first_name, last_name, occupation, date_of_birth, deceased)
VALUES ('Elvis', 'Presley', 'Singer, Musican, Actor', '01/08/1935', NULL);

/*
Exercise 9
Check the schema of the animals table. What would happen if we tried to insert the following data to the table?

Name				Binomial Name				Max Weight (kg)		Max Age (years)		Conservation Status
Dove				Columbidae Columbiformes	2					15					LC
Golden Eagle		Aquila Chrysaetos			6.35				24					LC
Peregrine Falcon	Falco Peregrinus			1.5					15					LC
Pigeon				Columbidae Columbiformes	2					15					LC
Kakapo				Strigops habroptila			4					60					CR

Identify the problem and alter the table so that the data can be entered as shown, and then insert the data.
change pigeon to Columba livia domestica

There is a unique constraint on the binomial_name so the Dove and the Pigeon cannot have the same binomial_name.
*/
INSERT INTO animals (name, binomial_name, max_weight_kg, max_age_years, conservation_status)
VALUES ('Dove', 'Columbidae Columbiformes', 2, 15, 'LC'),
('Golden Eagle', 'Aquila Chrysaetos', 6.35, 24, 'LC'),
('Peregrine Falcon', 'Falco Peregrinus', 1.5, 15, 'LC'),
('Pigeon', 'Columba livia domestica', 2, 15, 'LC'),
('Kakapo', 'Strigops habroptila', 4, 60, 'CR');

/*
Exercise 10
Connect to the ls_burger database and examine the schema for the orders table.

Based on the table schema and following information, write and execute an INSERT statement
to add the appropriate data to the orders table.

There are three customers -- James Bergman, Natasha O'Shea, Aaron Muller. James' email address
is james1998@email.com. Natasha's email address is natasha@osheafamily.com. Aaron doesn't supply an email address.

James orders a LS Chicken Burger, Fries and a Cola. Natasha has two orders -- an LS Cheeseburger
with Fries but no drink, and an LS Double Deluxe Burger with Onion Rings and a Chocolate Shake.
Aaron orders an LS Burger with no side or drink.

The item costs and loyalty points are listed below:

Item						            Cost ($)	Loyalty Points
LS Burger					          3.00		  10
LS Cheeseburger				      3.50		  15
LS Chicken Burger			      4.50		  20
LS Double Deluxe Burger		  6.00		  30
Fries					              0.99		  3
Onion Rings					        1.50		  5
Cola						            1.50		  5
Lemonade					          1.50		  5
Vanilla Shake				        2.00		  7
Chocolate Shake				      2.00		  7
Strawberry Shake			      2.00		  7
*/

INSERT INTO orders
(customer_name, customer_email, burger, side, drink, burger_cost, side_cost, drink_cost, customer_loyalty_points)
VALUES
('James Bergman', 'james1998@email.com', 'LS Chicken Burger', 'Fries', 'Cola', 4.50, 0.99, 1.50, (20+3+5)),
('Natasha O''Shea', 'natasha@osheafamily.com', 'LS Cheeseburger', 'Fries', NULL, 3.50, 0.99, DEFAULT, (15+3)),
('Natasha O''Shea', 'natasha@osheafamily.com', 'LS Double Deluxe Cheeseburger', 'Onion Rings', 'Chocolate Shake', 6.00, 1.50, 2.00, (30+5+7)),
('Aaron Muller', NULL, 'LS Burger', NULL, NULL, 3.00, DEFAULT, DEFAULT, 10);
