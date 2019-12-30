/*
Exercise 2

Write a query that determines how many tickets have been sold.
*/
SELECT count(id) AS "Number of Tickets" FROM tickets;

/*
Exercise 3

Write a query that determines how many different customers purchased tickets to at least one event.
*/
SELECT count(DISTINCT customer_id) AS "Number of customers who bought at least one ticket"
FROM tickets
INNER JOIN customers
ON tickets.customer_id = customers.id;

-- I made it way too hard, here is the Launch School Solution
SELECT count(DISTINCT customer_id)
FROM tickets;
-- this works because customer_id cannot be NULL

/*
Exercise 4

Write a query that determines what percentage of the customers in the database have
purchased a ticket to one or more of the events.
*/
SELECT count(DISTINCT tickets.customer_id)/count(DISTINCT customers.id)::float * 100 AS "Percentage of customers who bought at least one ticket"
FROM customers
LEFT OUTER JOIN tickets
ON customers.id = tickets.customer_id;

-- With subqueries it reads much easier
SELECT (SELECT count(DISTINCT tickets.customer_id) FROM tickets) / (SELECT count(id) FROM customers)::float*100 AS "Percentage of customers who bought at least one ticket";
/*
My difficulty in arriving at the answer was caused by my not reading the problem
carfefully enough.  From the tickets table we want a customer who has purchased
a ticket to one or more events.  To clarify, let us look at the following
SQL Statement and examine the results in light of the problem statement:

SELECT customer_id, event_id FROM tickets WHERE customer_id = 8528;

 customer_id | event_id
-------------+----------
        8528 |        1
        8528 |        1
        8528 |        7
        8528 |        7
(4 rows)

We see that customer.id 8528 has purchased
a total of 4 tickets, 2 from event 1 and 2
from event 7.  However, the problem only
called for customers who have purchased a
ticket to one or more events.  So even though
tickets have been purchased to 2 events,
customer.id 8528 will only be counted once.
If customer.id 8528 had only purchased 1
ticket to 1 event it still would be counted 1
time.

Thus in order to fullfil this requirement we
only need to count unique tickets.customer_id's
that appear in the tickets table, because if it
appears in the tickets table we can be guaranteed
that that customer_id can be associated with at
least one event.

Now the first thing the LEFT OUTER JOIN is going
to do is to do an INNER JOIN on the conditions
set forth in the ON condition, so all customers
who are in the tickets table are going to be
selected, but then the LEFT JOIN is going to
add those customers who appear in the customers
table but ARE NOT IN the tickets table.

It must be remembered that a virtual table is
constructed, then the identifiers in the SELECT
statement are run on the resulting virtual table.

If we run an SQL command just to count all of
the tickets in the tickets table we would do

SELECT count(id) AS "Ticket Count" FROM tickets;

 Ticket Count
--------------
         3783
(1 row)

We would get the same thing if we did a LEFT OUTER JOIN
between customers and tickets and only counted where
tickets.customer_id was the same as customer.id

SELECT count(tickets.customer_id) AS "Ticket Count" FROM customers LEFT OUTER JOIN tickets ON customers.id = tickets.customer_id;

 Ticket Count
--------------
         3783
(1 row)

We would get the same result if we did an INNER JOIN on the two tables where the customers.id matches
the tickets.customer_id:

SELECT count(tickets.id) AS "Ticket Count" FROM tickets INNER JOIN customers ON tickets.customer_id = customers.id;

 Ticket Count
--------------
         3783
(1 row)

Now if we just want to count the size of the virtual table itself we can do the following:

SELECT count(customers.id) AS "Left Outer Join Customer Count" FROM customers LEFT OUTER JOIN tickets ON customers.id = tickets.customer_id;

 Ticket Count
--------------
        12131
(1 row)

this result shows all of the INNER JOIN between customers and tickets where their ids match, which would be the
entire tickets table or 3783 entries, plus all of the entries in the customers table which do not appear
in the tickets table, i.e., where customer.id does not appear in any tickets.customer_id column.  This
 means that there should be 12131 - 3783 = 8348 entries, we can verify with the following SQL statement:

SELECT count(customers.id) AS "Customers Who Bought No Ticket" FROM customers WHERE customers.id NOT IN (SELECT customer_id FROM tickets);

 Customers Who Bought No Ticket
--------------------------------
                           8348
(1 row)
*/

/*
Exercise 5

Write a query that returns the name of each event and how many tickets were sold for it, in order from most popular to least popular.

1.  We want the name of each event in the tickets table
2.  We want to count the number of distinct events in the tickets table
3.  We order the results by the number of tickets bought from greatest to least
*/
SELECT events.name AS "Event Name", count(tickets.event_id) AS "Popularity"
FROM tickets INNER JOIN events
ON events.id = tickets.event_id
GROUP BY tickets.event_id, events.name
ORDER BY "Popularity" DESC;

/*
To get a better feel of how the GROUP BY
works group all of the event ids from the
tickets table along with tickets purchased
for each event.

the GROUP BY partitions the virtual table
first according to the tickets.event_id and
then by all ticket.ids for each event_id.
*/
SELECT tickets.event_id AS "Event Number", tickets.id AS "Ticket Number"
FROM tickets INNER JOIN events
ON events.id = tickets.event_id
GROUP BY tickets.event_id, tickets.id
ORDER BY tickets.event_id DESC;

/*
Here is the first portion of the table:

--------------+---------------
           10 |          3596
           10 |          3725
           10 |          3703
           10 |          3475
           10 |          3728
           10 |          3464
           10 |          3535
           10 |          3669
           10 |          3702
*/

/*
The Launch School solution did another LEFT OUTER JOIN, I will try to
replicate it here.  Below is my solution
*/
SELECT e.name AS "Event Name", count(t.id) AS "Popularity"
FROM tickets AS t
LEFT OUTER JOIN events AS e
ON t.event_id = e.id
GROUP BY e.id
ORDER BY "Popularity" DESC;

-- Here is the Launch School Solution
SELECT e.name, COUNT(t.id) AS popularity
FROM events AS e LEFT OUTER JOIN tickets AS t ON t.event_id = e.id
GROUP BY e.id
ORDER BY popularity DESC;

/*
I do not understand the use of a LEFT OUTER JOIN
as an INNER JOIN can solve the problem, the tickets
table has everything we need to solve this problem
other than the event name.
*/

/*
Exercise 6

Write a query that returns the user id, email address, and number of events for all
customers that have purchased tickets to three events.

I needed to look at the output.  What the question is asking for is
customer id, customer email where customers purchased tickets to 3 different
events.  The question is not asking for total number of tickets purchased to
each of those three events.  The expected output is:

  id   |                email                 | count
-------+--------------------------------------+-------
  141  | isac.hayes@herzog.net                |     3
  326  | tatum.mraz@schinner.org              |     3
  624  | adelbert.yost@kleinwisozk.io         |     3
  1719 | lionel.feeney@metzquitzon.biz        |     3
  2058 | angela.ruecker@reichert.co           |     3
  3173 | audra.moore@beierlowe.biz            |     3
  4365 | ephraim.rath@rosenbaum.org           |     3
  6193 | gennaro.rath@mcdermott.co            |     3
  7175 | yolanda.hintz@binskshlerin.com       |     3
  7344 | amaya.goldner@stoltenberg.org        |     3
  7975 | ellen.swaniawski@schultzemmerich.net |     3
  9978 | dayana.kessler@dickinson.io          |     3
(12 rows)

Now let us run a query on the tickets table with customer_id = 141:
SELECT * FROM tickets WHERE customer_id = 141;

  id  | event_id | seat_id | customer_id
------+----------+---------+-------------
  261 |        1 |     103 |         141
 3082 |        8 |     159 |         141
 3083 |        8 |     160 |         141
 3447 |       10 |     694 |         141
(4 rows)

We see that a total of 4 tickets were bought for 3 events
1 ticket each for event 1 and 10 and 2 tickets for event 8.

1.  SELECT customer.id, customer.email FROM customer
2.  We need to count the unique events for each customer
3.  Finally, this count of unique events need to be equal to 3
*/
SELECT c.id, c.email, count(DISTINCT t.event_id) AS event_count
FROM customers AS c
INNER JOIN tickets AS t
ON c.id = t.customer_id
GROUP BY c.id
HAVING count(DISTINCT t.event_id) = 3;

/*
Exercise 7

Write a query to print out a report of all tickets purchased by the customer with the
email address 'gennaro.rath@mcdermott.co'. The report should include the event name and
starts_at and the seat's section name, row, and seat number.

1.  So we need to find the customer with email address in the tickets table.
2.  We need to find all of the events he bought tickets for so we can get the event.name and the starts_at
3.  Then we need to find the seat_id so we can find the section_name, set row, and seat number
*/
/*
SELECT e.name AS "Event Name", e.starts_at AS "Start Date and Time", sec.name AS "Section Name", s.row AS "Seat Row", s.number AS "Seat Number"
FROM
*/
SELECT e.name AS "Event Name", e.starts_at AS "Start Date And Time",
sec.name AS "Section", s.row AS "Seat Row", s.number AS "Seat Number",
t.id AS "Ticket Number"
FROM customers AS c
INNER JOIN tickets AS t
ON c.id = t.customer_id
INNER JOIN events AS e
ON t.event_id = e.id
INNER JOIN seats AS s
ON t.seat_id = s.id
INNER JOIN sections AS sec
ON s.section_id = sec.id
WHERE c.email = 'gennaro.rath@mcdermott.co';


