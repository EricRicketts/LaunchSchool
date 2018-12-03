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

  def test_each
    arr = []
    expected = [
      "[ ] Buy Milk",
      "[ ] Clean Room",
      "[ ] Go To Gym"
    ]
    binding.pry
    list.each { |item| arr.push(item.to_s) }
    assert_equal(expected, arr)
  end
end
