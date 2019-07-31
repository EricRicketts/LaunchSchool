=begin
In this assignment, we'll continue the process of implementing methods in the DatabasePersistence class
to restore the original functionality of the application. We'll focus on the methods that are required
to create, edit, and delete lists.

Practice Problems
=end

# 1.  Write a new implementation of DatabasePersistence#create_new_list that inserts new rows into the database.
SQL_NEW_LIST = <<~SQL
INSERT INTO lists (name)
VALUES ($1);
SQL

def create_new_list(list_name)
  query(SQL_NEW_LIST, list_name)
end

# 2.  Write a new implementation of DatabasePersistence#delete_list that removes the correct row from the lists table.
SQL_DELETE_LIST = <<~SQL
DELETE FROM lists WHERE id = $1;
SQL

def delete_list(list_id)
  list_id = list_id.to_i
  query(SQL_DELETE_LIST, list_id)
end

# 3.  Write a new implementation of DatabasePersistence#update_list_name that updates a row in the database.
SQL_UPDATE_LIST = <<~SQL
UPDATE lists
SET name = $2
WHERE id = $1;
SQL

def update_list_name(list_id, list_name)
  list_id = list_id.to_i
  query(SQL_UPDATE_LIST, list_id, list_name)
end