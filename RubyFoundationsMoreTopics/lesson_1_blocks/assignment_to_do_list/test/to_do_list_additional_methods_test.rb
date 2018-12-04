require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'
require_relative '../code/to_do_list'

class ToDoListTest < Minitest::Test
  attr_accessor :list, :item1, :item2, :item3, :item4

  def setup
    @item1 = ToDo.new("Buy Milk", "Need milk for breakfast")
    @item2 = ToDo.new("Clean Room", "Room is a mess")
    @item3 = ToDo.new("Go To Gym", "Increase Testosterone")
    @item4 = ToDo.new("Go To Gym", "Do fitness routine")
    @list = ToDoList.new("Today's List")
    [item1, item2, item3, item4].each do |item|
      list.add(item)
    end
  end

  def test_find_by_title
    expected = [item3.class, item3.title, item3.description]
    result = list.find_by_title("Go To Gym")
    assert_equal(expected, [result.class, result.title, result.description])
  end
end
