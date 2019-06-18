-- Exercise 1: From the Terminal, create a database called encyclopedia and connect to it via the the psql console.
-- createdb encyclopedia
-- psql -d encyclopedia

/*
Exercise 2
Create a table called countries. It should have the following columns:

An id column of type serial
A name column of type varchar(50)
A capital column of type varchar(50)
A population column of type integer
The name column should have a UNIQUE constraint.
The name and capital columns should both have NOT NULL constraints.
*/
CREATE TABLE countries (
  	id SERIAL,
  	name VARCHAR(50) UNIQUE NOT NULL,
  	capital VARCHAR(50) NOT NULL,
  	population INTEGER
);

/*
Exercise 3
Create a table called famous_people. It should have the following columns:

An id column that contains auto-incrementing values
A name column. This should contain a string up to 100 characters in length
An occupation column. This should contain a string up to 150 characters in length
A date_of_birth column that should contain each person's date of birth in a string of up to 50 characters
A deceased column that contains either true or false
The table should prevent NULL values being added to the name column.
If the value of the deceased column is unknown then false should be used.
*/
CREATE TABLE famous_people (
	id SERIAL,
	name VARCHAR(100) NOT NULL,
	occupation VARCHAR(150),
	date_of_birth VARCHAR(50),
	deceased BOOLEAN DEFAULT FALSE
);

/*
Exercise 4
Create a table called animals that could contain the sample data below:

Name	       Binomial Name	  Max Weight (kg)	Max Age (years)	Conservation Status
Lion	       Pantera leo	      250	            20	            VU
Killer Whale   Orcinus orca	      6,000	            60	            DD
Golden Eagle   Aquila chrysaetos  6.35	            24	            LC

The database table should also contain an auto-incrementing id column.
Each animal should always have a name and a binomial name.
Names and binomial names vary in length but never exceed 100 characters.
The max weight column should be able to hold data in the range 0.001kg to 40,000kg
Conservation Status is denoted by a combination of two letters (CR, EN, VU, etc).
*/
CREATE TABLE animals (
	id SERIAL,
	name VARCHAR(100) NOT NULL,
	binomial_name VARCHAR(100) NOT NULL,
	max_weight NUMERIC(8, 3) CHECK (max_weight > 40000 AND max_weight < 0.001),
	max_age INTEGER,
	conservation_status CHAR(2)
);

-- Exercise 5: List all of the tables in the encyclopedia database.
-- \dt

-- Exercise 6: Display the schema for the animals table.
-- \d animals

-- Exercise 7: Create a database called ls_burger and connect to it.
-- CREATE DATABASE ls_burger;
-- \connect ls_burger or \c ls_burger

/*
Exercise 8
Create a table in the ls_burger database called orders. The table should have the following columns:

An id column, that should contain an auto-incrementing integer value.
A customer_name column, that should contain a string of up to 100 characters
A burger column, that should hold a string of up to 50 characters
A side column, that should hold a string of up to 50 characters
A drink column, that should hold a string of up to 50 characters
An order_total column, that should hold a numeric value in dollars and cents. Assume that all orders will be less than $100.

The customer_name and order_total columns should always contain a value.
*/
CREATE TABLE orders (
	id SERIAL,
	customer_name VARCHAR(100) NOT NULL,
	burger VARCHAR(50),
	side VARCHAR(50),
	drink VARCHAR(50),
	order_total NUMERIC(4, 2) NOT NULL CHECK (order_total >= 0.00 AND order_total <= 99.99)
);