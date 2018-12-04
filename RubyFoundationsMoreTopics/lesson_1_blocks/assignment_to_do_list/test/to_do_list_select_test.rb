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

  def test_select
    list.mark_done_at(1)
    expected = [ToDo, true, "Clean Room", "Room is a mess"]
    selected = list.select { |item| item.done? }
    result = [selected.class, selected.title]
    assert_equal([ToDoList, "Today's List"], result)
    selected.each do |item|
      result = [item.class, item.done?, item.title, item.description]
      assert_equal(expected, result)
    end
  end
end
