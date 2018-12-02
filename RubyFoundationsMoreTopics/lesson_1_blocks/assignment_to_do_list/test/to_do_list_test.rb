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
    item = list.first
    result = [item.class, item.title, item.description]
    assert_equal(expected, result)
  end

  def test_last
    expected = [ToDo, "Go To Gym", "Increase Testosterone"]
    item = list.last
    result = [item.class, item.title, item.description]
    assert_equal(expected, result)
  end

  def test_to_a
    arr = list.to_a
    assert(arr.all?(ToDo))
  end

  def test_item_at
    expected = [ToDo, "Clean Room", "Room is a mess"]
    item = list.item_at(1)
    result = [item.class, item.title, item.description]
    assert_equal(expected, result)
  end

  def test_item_at_no_argument
    assert_raises(ArgumentError) { list.item_at }
  end

  def test_item_at_out_of_range
    assert_raises(IndexError) { list.item_at(100) }
  end

  def test_list_mark_done_at
    list.mark_done_at(1)
    assert(list.item_at(1).done?)
  end

  def test_list_mark_done_at_no_argument
    assert_raises(ArgumentError) { list.mark_done_at() }
  end

  def test_list_mark_done_at_out_of_range
    assert_raises(IndexError) { list.mark_done_at(100) }
  end

  def test_list_mark_undone_at
    list.mark_done_at(1)
    first_toggle = list.item_at(1).done?
    list.mark_undone_at(1)
    second_toggle = list.item_at(1).done?
    assert_equal([true, false], [first_toggle, second_toggle])
  end

  def test_list_mark_undone_at_no_argument
    assert_raises(ArgumentError) { list.mark_undone_at }
  end

  def test_list_mark_undone_at_out_of_range
    assert_raises(IndexError) { list.mark_undone_at(100) }
  end

  def test_list_done
    list.done!
    assert(list.todos.all? { |item| item.done? })
  end

  def test_list_undone
    list.done!
    list.undone!
    assert(list.todos.none? { |item| item.done? })
  end

  def test_shift
    item = list.shift
    expected = [
      ToDo, "Buy Milk", "Need milk for breakfast", 2
    ]
    result = [
      item.class, item.title, item.description, list.size
    ]
    assert_equal(expected, result)
  end

  def test_pop
    item = list.pop
    expected = [
      ToDo, "Go To Gym", "Increase Testosterone", 2
    ]
    result = [
      item.class, item.title, item.description, list.size
    ]
    assert_equal(expected, result)
  end

  def test_remove_at
    item = list.remove_at(1)
    expected = [ToDo, "Clean Room", "Room is a mess", 2]
    result = [item.class, item.title, item.description, list.size]
    assert_equal(expected, result)
  end

  def test_remove_at_no_argument
    assert_raises(ArgumentError) { list.remove_at() }
  end

  def test_remove_at_out_of_range
    assert_raises(IndexError) { list.remove_at(100) }
  end

  def test_to_s
    list.mark_done_at(1)
    expected = [
      "---- Today's Todos ----\n",
      "[ ] Buy Milk\n",
      "[X] Clean Room\n",
      "[ ] Go To Gym\n"
    ].join
    assert_equal(expected, list.to_s)
  end
end
