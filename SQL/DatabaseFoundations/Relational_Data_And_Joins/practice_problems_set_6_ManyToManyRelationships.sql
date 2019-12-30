/*
Exercise 1

Write a SQL statement that will return the following result:

 id |     author      |           categories
----+-----------------+--------------------------------
  1 | Charles Dickens | Fiction, Classics
  2 | J. K. Rowling   | Fiction, Fantasy
  3 | Walter Isaacson | Nonfiction, Biography, Physics
(3 rows)
*/
SELECT b.id, b.author, string_agg(c.name, ', ') AS "categories"
FROM books AS b
INNER JOIN books_categories AS bc
ON b.id = bc.book_id
INNER JOIN categories AS c
ON bc.category_id = c.id
GROUP BY b.id
ORDER BY b.id;

/*
Exercise 2

Write SQL statements to insert the following new books into the database.
What do you need to do to ensure this data fits in the database?

Author							Title											Categories
Lynn Sherr						Sally Ride: America's First Woman in Space		Biography, Nonfiction, Space Exploration
Charlotte Brontë				Jane Eyre										Fiction, Classics
Meeru Dhalwala and Vikram Vij	Vij's: Elegant and Inspired Indian Cuisine		Cookbook, Nonfiction, South Asia
*/
ALTER TABLE books ALTER COLUMN title TYPE VARCHAR(100);
ALTER TABLE books ALTER COLUMN author TYPE VARCHAR(100);

INSERT INTO books (title, author) VALUES
('Sally Ride: America''s First Woman in Space', 'Lynn Sherr'),
('Jane Eyre', 'Charlotte Brontë'),
('Meeru Dhalwala and Vikram Vij', 'Vij''s: Elegant and Inspired Indian Cuisine');

INSERT INTO categories (name) VALUES
('Space Exploration'),
('Cookbook'),
('South Asia');

INSERT INTO books_categories (book_id, category_id) VALUES
(4, 5),
(4, 1),
(4, 7),
(5, 2),
(5, 4),
(6, 8),
(6, 1),
(6, 9);

-- Now to check that I did it correctly
SELECT b.id, b.author, string_agg(c.name, ', ') AS "categories"
FROM books AS b
INNER JOIN books_categories AS bc
ON b.id = bc.book_id
INNER JOIN categories AS c
ON bc.category_id = c.id
WHERE b.id BETWEEN 4 AND 6
GROUP BY b.id
ORDER BY b.id;
-- works!!

/*
Exercise 3

Write a SQL statement to add a uniqueness constraint on the combination of columns book_id and
category_id of the books_categories table. This constraint should be a table constraint; so, it
should check for uniqueness on the combination of book_id and category_id across all rows of the
books_categories table.
*/
ALTER TABLE books_categories ADD CONSTRAINT book_category_pair_unique UNIQUE(book_id, category_id);

/*
Exercise 4

Write a SQL statement that will return the following result:

      name        | book_count |                                 book_titles
------------------+------------+-----------------------------------------------------------------------------
Biography         |          2 | Einstein: His Life and Universe, Sally Ride: America's First Woman in Space
Classics          |          2 | A Tale of Two Cities, Jane Eyre
Cookbook          |          1 | Vij's: Elegant and Inspired Indian Cuisine
Fantasy           |          1 | Harry Potter
Fiction           |          3 | Jane Eyre, Harry Potter, A Tale of Two Cities
Nonfiction        |          3 | Sally Ride: America's First Woman in Space, Einstein: His Life and Universe, Vij's: Elegant and Inspired Indian Cuisine
Physics           |          1 | Einstein: His Life and Universe
South Asia        |          1 | Vij's: Elegant and Inspired Indian Cuisine
Space Exploration |          1 | Sally Ride: America's First Woman in Space
*/
SELECT c.name AS "category", count(bc.book_id) AS "book count", string_agg(b.title, ', ') AS "book titles"
FROM categories AS c
INNER JOIN books_categories AS bc
ON c.id = bc.category_id
INNER JOIN books AS b
ON bc.book_id = b.id
GROUP BY c.id
ORDER BY "category";

