require_relative './to_do'

class ToDoList
  attr_accessor :title

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

  def done!
    todos.each_index { |index| mark_done_at(index) }
  end

  def done?
    todos.all? { |item| item.done? }
  end

  def each(&block)
    enumerator.each &block
    self
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

  def pop
    todos.pop
  end

  def remove_at(index)
    todos.delete(item_at(index))
  end

  def select(&block)
    new_list = ToDoList.new(title)
    enumerator.select(&block).each { |item| new_list.add(item) }
    new_list
  end

  def shift
    todos.shift
  end

  def size
    todos.size
  end

  def to_a
    todos
  end

  def to_s
    text = "---- Today's Todos ----\n"
    text << todos.map(&:to_s).join("\n")
    text.concat("\n")
  end

  def undone!
    todos.each_index { |index| mark_undone_at(index) }
  end

  def undone?
    todos.none? { |item| item.done? }
  end

  alias_method :<<, :add

  protected

  attr_accessor :todos

  private

  def enumerator
    self.todos.to_enum
  end

  def valid?(item)
    raise TypeError unless item.instance_of?(ToDo)
    true
  end
end
