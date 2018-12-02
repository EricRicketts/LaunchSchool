require_relative './to_do'

class ToDoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(item)
    begin
      todos.push(item) if valid?(item)
    rescue TypeError => e
      e.message << " can only add ToDo objects."
    end
  end

  def first
    todos.first
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def item_at(index)
    todos.fetch(index)
  end

  def last
    todos.last
  end

  def size
    todos.size
  end

  def to_a
    todos
  end

  alias_method :<<, :add

  private

  def valid?(item)
    raise TypeError unless item.instance_of?(ToDo)
    true
  end


end
