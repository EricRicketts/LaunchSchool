require 'pg'
require 'pry-byebug'
class DatabasePersistence
  SQL_ALL_LISTS = 'SELECT id, name FROM lists;'
  SQL_FIND_LIST = <<~SQL
  SELECT td.id, td.name, td.completed
  FROM todos AS td
  WHERE td.list_id = $1;
  SQL
  SQL_NEW_LIST = <<~SQL
  INSERT INTO lists (name)
  VALUES ($1);
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
    # list = find_list(list_id)
    # id = create_id(list[:todos])
    # list[:todos] << { id: id, name: todo_name, completed: false }
  end

  def delete_list(list_id)
    # idx = all_lists.index { |list| list[:id] == list_id }
    # all_lists.delete_at(idx)
  end

  def delete_todo_from_list(list_id, todo_id)
    # list = find_list(list_id)
    # idx = list[:todos].index { |todo| todo[:id] == todo_id }
    # list[:todos].delete_at(idx)
  end

  def find_list(list_id, list_name = '')
    result = query(SQL_FIND_LIST, list_id.to_i)
    name_value = list_name.empty? ? result.getvlaue(0, 1) : list_name
    hsh = { id: list_id, name: name_value, todos: [] }

    result.each do |tuple|
      todo_hsh = { id: tuple["id"].to_i,
        name: tuple["name"],
        completed: tuple["completed"] == "t"
      }
      hsh[:todos].push(todo_hsh)
    end
    hsh
  end

  def mark_all_todos_as_completed(list_id)
    # list = find_list(list_id)
    # list[:todos].each { |todo| todo[:completed] = true }
  end

  def query(statement, *params)
    db.exec_params(statement, params)
  end

  def update_list_name(list_id, list_name)
    # list = find_list(list_id)
    # list[:name] = list_name
  end

  def update_todo_status(list_id, todo_id, status)
    # list = find_list(list_id)
    # todo = list[:todos].find { |todo| todo[:id] == todo_id }
    # todo[:completed] = status
  end
end
