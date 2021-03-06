require 'pg'
require 'pry-byebug'
class DatabasePersistence
  SQL_ALL_LISTS = <<~SQL
  SELECT id, name
  FROM lists;
  SQL

  SQL_FIND_LIST = <<~SQL
  SELECT l.id, l.name
  FROM lists AS l
  WHERE l.id = $1;
  SQL

  SQL_NEW_LIST = <<~SQL
  INSERT INTO lists (name)
  VALUES ($1);
  SQL

  SQL_UPDATE_LIST = <<~SQL
  UPDATE lists
  SET name = $2
  WHERE id = $1;
  SQL

  SQL_DELETE_LIST = <<~SQL
  DELETE FROM lists WHERE id = $1;
  SQL

  SQL_FIND_TODOS = <<~SQL
  SELECT td.id, td.name, td.completed
  FROM todos AS td
  WHERE td.list_id = $1;
  SQL

  SQL_NEW_TODO = <<~SQL
  INSERT INTO todos (name, list_id)
  VALUES
  ($2, $1);
  SQL

  SQL_DELETE_TODO = <<~SQL
  DELETE FROM todos
  WHERE list_id = $1 AND id = $2;
  SQL

  SQL_DELETE_ALL_TODOS = <<~SQL
  DELETE FROM todos WHERE list_id = $1;
  SQL

  SQL_UPDATE_TODO_STATUS = <<~SQL
  UPDATE todos
  SET completed = $3
  WHERE list_id = $1 AND id = $2;
  SQL

  SQL_MARK_ALL_TODOS_COMPLETE = <<~SQL
  UPDATE todos
  SET completed = TRUE
  WHERE list_id = $1;
  SQL

  attr_accessor :db

  def initialize
    @db = PG::Connection.new(dbname: 'todos')
  end

  def all_lists
    result = query(SQL_ALL_LISTS)
    result.map do |tuple|
      find_list(tuple["id"], tuple["name"])
    end
  end

  def create_new_list(list_name)
    query(SQL_NEW_LIST, list_name)
  end

  def create_new_todo(list_id, todo_name)
    list_id = list_id.to_i
    query(SQL_NEW_TODO, list_id, todo_name)
  end

  def delete_list(list_id)
    list_id = list_id.to_i
    query(SQL_DELETE_ALL_TODOS, list_id)
    query(SQL_DELETE_LIST, list_id)
  end

  def delete_todo_from_list(list_id, todo_id)
    list_id = list_id.to_i
    todo_id = todo_id.to_i
    query(SQL_DELETE_TODO, list_id, todo_id)
  end

  def find_list(list_id, list_name = '')
    list_id = list_id.to_i
    result = query(SQL_FIND_LIST, list_id)
    return result.values if result.values.empty?

    name_value = list_name.empty? ? result.getvalue(0, 1) : list_name
    todos = find_todos_for_list(list_id)
    { id: list_id, name: name_value, todos: todos }
  end

  def mark_all_todos_as_completed(list_id)
    list_id = list_id.to_i
    query(SQL_MARK_ALL_TODOS_COMPLETE, list_id)
  end

  def query(statement, *params)
    db.exec_params(statement, params)
  end

  def update_list_name(list_id, list_name)
    list_id = list_id.to_i
    query(SQL_UPDATE_LIST, list_id, list_name)
  end

  def update_todo_status(list_id, todo_id, status)
    list_id = list_id.to_i
    todo_id = todo_id.to_i
    query(SQL_UPDATE_TODO_STATUS, list_id, todo_id, status)
  end

  def find_todos_for_list(list_id)
    result = query(SQL_FIND_TODOS, list_id)
    result.map do |tuple|
      { id: tuple["id"].to_i,
        name: tuple["name"],
        completed: tuple["completed"] == "t"
      }
    end
  end
end
