require_relative './to_do'

class ToDoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(item)
    todos.push(item)
  end

  def size
    todos.size
  end
end
