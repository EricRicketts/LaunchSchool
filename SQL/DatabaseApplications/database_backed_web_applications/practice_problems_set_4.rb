=begin
In this assignment, we'll continue the process of implementing methods in the DatabasePersistence class to restore the original
functionality of the application. We'll focus on the methods that are required to create, complete, and delete todos.

Practice Problems
=end

# 1.  Write a new implementation of DatabasePersistence#create_new_todo that inserts new rows into the database.
SQL_NEW_TODO = <<~SQL
INSERT INTO todos (name, list_id)
VALUES
($2, $1);
SQL

def create_new_todo(list_id, todo_name)
  list_id = list_id.to_i
  query(SQL_NEW_TODO, list_id, todo_name)
end

# 2.  Write a new implementation of DatabasePersistence#delete_todo_from_list that removes the correct row from the todos table.
SQL_DELETE_TODO = <<~SQL
DELETE FROM todos
WHERE list_id = $1 AND id = $2;
SQL

def delete_todo_from_list(list_id, todo_id)
  list_id = list_id.to_i
  todo_id = todo_id.to_i
  query(SQL_DELETE_TODO, list_id, todo_id)
end

# 3.  Write a new implementation of DatabasePersistence#update_todo_status that updates a row in the database.
SQL_UPDATE_TODO_STATUS = <<~SQL
UPDATE todos
SET completed = $3
WHERE list_id = $1 AND id = $2;
SQL

def update_todo_status(list_id, todo_id, status)
  list_id = list_id.to_i
  todo_id = todo_id.to_i
  query(SQL_UPDATE_TODO_STATUS, list_id, todo_id, status)
end

# 4.  Write a new implementation of DatabasePersistence#mark_all_todos_as_completed that updates all rows in the database.
SQL_MARK_ALL_TODOS_COMPLETE = <<~SQL
UPDATE todos
SET completed = TRUE
WHERE list_id = $1;
SQL

def mark_all_todos_as_completed(list_id)
  list_id = list_id.to_i
  query(SQL_MARK_ALL_TODOS_COMPLETE, list_id)
end
