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
    (0..3).each do |index|
      list.mark_done_at(index) if index.even?
    end
  end

  def test_all_done
    done_list = list.all_done
    expected = [
      ToDoList, "Done ToDos",
      @item1.done, @item1.title, @item1.description,
      @item3.done, @item3.title, @item3.description
    ]
    result = [
      done_list.class, done_list.title,
      done_list.first.done, done_list.first.title, done_list.first.description,
      done_list.last.done, done_list.last.title, done_list.last.description
    ]
    assert_equal([2, expected], [done_list.size, result])
  end

  def test_all_not_done
    not_done_list = list.all_not_done
    expected = [
      ToDoList, "Not Done ToDos",
      @item2.done, @item2.title, @item2.description,
      @item4.done, @item4.title, @item4.description
    ]
    result = [
      not_done_list.class, not_done_list.title,
      not_done_list.first.done, not_done_list.first.title, not_done_list.first.description,
      not_done_list.last.done, not_done_list.last.title, not_done_list.last.description
    ]
    assert_equal([2, expected], [not_done_list.size, result])
  end

  def test_mark_all_done
    list.mark_all_done
    assert(list.done?)
  end

  def test_mark_all_undone
    list.mark_all_undone
    assert(list.undone?)
  end
end
