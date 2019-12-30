require_relative 'test_helper'

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

  def teardown
    list.title = ''
    list.instance_variable_set('@todos', [])
  end

  def test_size
    assert_equal(3, list.size)
  end

  def test_add_improper_item
    assert("TypeError can only add ToDo objects.", list.add(1))
  end

  def test_shovel_operator
    item4 = ToDo.new("Foo", "Bar")
    list << item4
    assert_equal([item4, 4], [list.last, list.size])
  end

  def test_first
    assert_equal(item1, list.first)
  end

  def test_last
    assert_equal(item3, list.last)
  end

  def test_to_a
    assert_equal([item1, item2, item3], list.to_a)
  end

  def test_done?
    first_case = list.done?
    list.each { |item| item.done! }
    second_case = list.done?
    assert_equal([false, true], [first_case, second_case])
  end

  def test_item_at
    assert_equal(item2, list.item_at(1))
  end

  def test_item_at_no_argument
    assert_raises(ArgumentError) { list.item_at }
  end

  def test_item_at_out_of_range
    assert_raises(IndexError) { list.item_at(100) }
  end

  def test_list_mark_done_at
    list.mark_done_at(1)
    expected = [false, true, false]
    result = []
    list.each { |item| result << item.done? }
    assert_equal(expected, result)
  end

  def test_list_mark_done_at_no_argument
    assert_raises(ArgumentError) { list.mark_done_at() }
  end

  def test_list_mark_done_at_out_of_range
    assert_raises(IndexError) { list.mark_done_at(100) }
  end

  def test_list_mark_undone_at
    list.each { |item| item.done! }
    list.mark_undone_at(1)
    expected = [true, false, true]
    result = []
    list.each { |item| result << item.done? }
    assert_equal(expected, result)
  end

  def test_list_mark_undone_at_no_argument
    assert_raises(ArgumentError) { list.mark_undone_at }
  end

  def test_list_mark_undone_at_out_of_range
    assert_raises(IndexError) { list.mark_undone_at(100) }
  end

  def test_list_done
    list.done!
    to_do_items = []
    (0..2).to_a.each { |index| to_do_items << list.item_at(index) }
    assert_equal([true, true], [list.done?, to_do_items.all? { |item| item.done? }])
  end

  def test_list_undone
    list.done!
    list.undone!
    to_do_items = []
    (0..2).to_a.each { |index| to_do_items << list.item_at(index) }
    assert_equal([true, true], [list.undone?, to_do_items.none? { |item| item.done? }])
  end

  def test_shift
    assert_equal([item1, [item2, item3]], [list.shift, list.to_a])
  end

  def test_pop
    assert_equal([item3, [item1, item2]], [list.pop, list.to_a])
  end

  def test_remove_at
    assert_equal([item2, [item1, item3]], [list.remove_at(1), list.to_a])
  end

  def test_remove_at_no_argument
    assert_raises(ArgumentError) { list.remove_at() }
  end

  def test_remove_at_out_of_range
    assert_raises(IndexError) { list.remove_at(100) }
  end

  def test_to_s_none_done
    expected = <<~OUTPUT
    ---- Today's Todos ----
    [ ] Buy Milk
    [ ] Clean Room
    [ ] Go To Gym
    OUTPUT
    assert_equal(expected, list.to_s)
  end

  def test_to_s_one_done
    list.mark_done_at(1)
    expected = [
      "---- Today's Todos ----\n",
      "[ ] Buy Milk\n",
      "[X] Clean Room\n",
      "[ ] Go To Gym\n"
    ].join
    assert_equal(expected, list.to_s)
  end

  def test_to_s_all_done
    list.done!
    expected = <<~OUTPUT
    ---- Today's Todos ----
    [X] Buy Milk
    [X] Clean Room
    [X] Go To Gym
    OUTPUT
    assert_equal(expected, list.to_s)
  end
end
