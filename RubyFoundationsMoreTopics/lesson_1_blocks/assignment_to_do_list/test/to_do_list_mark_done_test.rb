require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'
require_relative '../code/to_do_list'

class ToDoListMarkDoneTest < Minitest::Test
  attr_accessor :list, :item1, :item2, :item3, :item4

  def setup
    @item1 = ToDo.new("Buy Milk", "Need milk for breakfast")
    @item2 = ToDo.new("Clean Room", "Room is a mess")
    @item3 = ToDo.new("Go To Gym", "Increase Testosterone")
    @item4 = ToDo.new("Go To Gym", "Fitness routine")
    @list = ToDoList.new("Today's List")
    [item1, item2, item3, item4].each do |item|
      list.add(item)
    end
  end

  def test_none_done
    assert_equal(4, list.all_not_done.size)
  end

  def test_mark_done
    list.mark_done("Go To Gym")
    done_list = list.all_done
    result = [
      done_list.first.done, done_list.first.title,
      done_list.first.description
    ]
    expected = [
      true, "Go To Gym", "Increase Testosterone"
    ]
    assert_equal(3, list.all_not_done.size)
    assert_equal(1, done_list.size)
    assert_equal(expected, result)
  end
end
