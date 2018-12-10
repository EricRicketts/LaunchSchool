require_relative 'test_helper'

class ToDoListEachTest < Minitest::Test
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

  def teardown
    list.title = ''
    list.instance_variable_set('@todos', [])
  end

  def test_each
    arr = []
    expected = [
      "[ ] Buy Milk",
      "[ ] Clean Room",
      "[ ] Go To Gym"
    ]
    list.each { |item| arr.push(item.to_s) }
    assert_equal(expected, arr)
  end

  def test_each_return
    arr = []
    assert_equal(list, list.each { |item| arr.push(item.to_s) })
  end
end
