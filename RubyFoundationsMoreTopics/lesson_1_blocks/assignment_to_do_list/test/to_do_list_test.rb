require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'
require_relative '../code/to_do_list'

class ToDoListTest < Minitest::Test
  attr_accessor :list, :item1, :item2, :item3

  def setup
    @item1 = ToDo.new("Buy Milk", "Need milk for breakfast")
    @item2 = ToDo.new("Clean Room", "Room is a mess")
    @item3 = ToDo.new("Go To Gym", "Increase Testosterone")
    @list = ToDoList.new("Today's List")
    [item1, item2, item3].each do |item|
      list.add(item)
    end
  end

  def test_add_to_list
    assert_equal(3, list.size)
  end

  def test_add_improper_item
    assert("TypeError can only add ToDo objects.", list.add(1))
  end

  def test_shovel_operator
    list << ToDo.new("Foo", "Bar")
    assert_equal(4, list.size)
  end

  def test_first
    expected = [ToDo, "Buy Milk", "Need milk for breakfast"]
    result = [list.first.class, list.first.title, list.first.description]
    assert_equal(expected, result)
  end

end
