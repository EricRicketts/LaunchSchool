-- 1.  What is the largest value that can be stored in the amount column? Use psql to illustrate what it is.
INSERT INTO expenses (amount, memo) VALUES (10000.34, 'A test on amount');
/*
result:

ERROR:  numeric field overflow
DETAIL:  A field with precision 6, scale 2 must round to an absolute value less than 10^4.
*/

-- 2.  What is the smallest value that can be stored in the amount column? Use psql to illustrate what it is.
INSERT INTO expenses (amount, memo) VALUES (-10000.34, 'A test on amount');
/*
result:

ERROR:  numeric field overflow
DETAIL:  A field with precision 6, scale 2 must round to an absolute value less than 10^4.
*/

-- 3.  Add a check constraint to the expenses table to ensure that amount only holds a positive value.
ALTER TABLE expenses ADD CONSTRAINT positive_amount_check CHECK (amount > 0.00);
