-- Exercise 1
-- Describe the difference between the varchar and text data types.

-- varchar has a hard limit on the number of characters, an error will
-- be thrown if the entry exceeds the character limit.
-- With the text data type there is no limit on the character size.

-- Exercise 2
-- Describe the difference between the integer, decimal, and real data types.

-- Integer if a whole number with no trailing decimals

-- real is a IEEE 754 standard floating point number with inexactness
-- it can represent a number with decimals

-- decimal is an exact number, particularly useful when precision is
-- required like monetary calculations.  It takes precision and scale
-- arguments which tell the total number of significant digits and
-- the number of digits after the decimal point

-- Exercise 3
-- What is the largest value that can be stored in an integer column?

-- Depends on smallint, interger, or bigint declarations but if
-- you go integer range is -2147483648 to +2147483647

-- Exercise 4
-- Describe the difference between the timestamp and date data types.

-- timestamp will show a time along with a date while date only
-- shows the date.

-- Exercise 5
-- Can a time with a time zone be stored in a column of type timestamp?

-- yes, PostgreSQL recommends both a date and time be stored with a timezone

-- I got thi wrong, I did not read the documentation carefully enough,
-- there is a timestamp with time zone abbreviated timestampz which
-- also takes a time zone.