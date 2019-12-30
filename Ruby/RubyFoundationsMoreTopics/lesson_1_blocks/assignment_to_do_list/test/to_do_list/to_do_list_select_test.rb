require_relative 'test_helper'

class ToDoListSelectTest < Minitest::Test
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

  def test_select
    list.mark_done_at(1)
    expected = [ToDo, true, "Clean Room", "Room is a mess"]
    selected = list.select { |item| item.done? }
    expected = [ToDoList, "Today's List", 1, [item2]]
    result = [
      selected.class, selected.title, selected.size, selected.to_a
    ]
    assert_equal(expected, result)
  end
end
