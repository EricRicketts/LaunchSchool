-- Exercise 1: Make sure you are connected to the encyclopedia database. Rename the famous_people table to celebrities.
ALTER TABLE famous_people RENAME TO celebrities;

-- Exercise 2: Change the name of the name column in the celebrities table to first_name, and change its data type to varchar(80).
ALTER TABLE celebrities RENAME COLUMN name TO first_name;
ALTER TABLE celebrities ALTER COLUMN first_name TYPE VARCHAR(80);

-- Exercise 3: Create a new column in the celebrities table called last_name. It should be able to hold strings of lengths up to 100 characters. This column should always hold a value.
ALTER TABLE celebrities ADD COLUMN last_name VARCHAR(100) NOT NULL;

-- Exercise 4: Change the celebrities table so that the date_of_birth column uses a data type that holds an actual date value rather than a string. Also ensure that this column must hold a value.
ALTER TABLE celebrities ALTER COLUMN date_of_birth TYPE DATE USING date_of_birth::date;
ALTER TABLE celebrities ALTER COLUMN date_of_birth SET NOT NULL;
-- single statement
ALTER TABLE celebrities ALTER COLUMN date_of_birth TYPE DATE USING date_of_birth::date, ALTER COLUMN date_of_birth SET NOT NULL;

-- Exercise 5: Change the max_weight_kg column in the animals table so that it can hold values in the range 0.0001kg to 200,000kg.
ALTER TABLE animals ALTER COLUMN max_weight_kg TYPE NUMERIC(10, 4);
-- I had a check constraint on the max_weight_kg column (max_weight_kg < 0.001 AND max_weight_kg > 40000) this was referred to as
-- the 'animals_max_weight_check' I learned that this was a table wide constraint even though it only applied to one column
-- to remove the constraint:
ALTER TABLE animals DROP CONSTRAINT animals_max_weight_check;
-- to add a new constraint on the column:
ALTER TABLE animals ADD CONSTRAINT animals_max_weight_check_kg CHECK (max_weight_kg < 0.0001 AND max_weight_kg > 200000);

-- Exercise 6: Change the animals table so that the binomial_name column cannot contain duplicate values.
ALTER TABLE animals ADD CONSTRAINT unique_binomial_name UNIQUE (binomial_name);

/*
Exercise 7
Connect to the ls_burger database. Add the following columns to the orders table:

A column called customer_email; it should hold strings of up to 50 characters.
A column called customer_loyalty_points that should hold integer values.

If no value is specified for this column, then a value of 0 should be applied.
*/
ALTER TABLE orders ADD COLUMN customer_email VARCHAR(50);
ALTER TABLE orders ADD COLUMN customer_loyalty_points INTEGER DEFAULT 0;

/*
Exercise 8
Add three columns to the orders table called burger_cost, side_cost, and drink_cost
to hold monetary values in dollars and cents (assume that all values will be less than $100).
If no value is entered for these columns, a value of 0 dollars should be used.
*/
ALTER TABLE orders ADD COLUMN burger_cost DECIMAL(4, 2) DEFAULT 0.00;
ALTER TABLE orders ADD COLUMN side_cost DECIMAL(4, 2) DEFAULT 0.00;
ALTER TABLE orders ADD COLUMN drink_cost DECIMAL(4, 2) DEFAULT 0.00;

-- Exercise 9: Remove the order_total column from the orders table.
ALTER TABLE orders DROP COLUMN order_total;
