require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'
require_relative '../code/to_do'

class ToDoTest < Minitest::Test
  attr_accessor :to_do

  def setup
    @to_do = ToDo.new("Item One", "Finish Lesson")
  end

  def test_initial_attributes
    expected = [false, "Item One", "Finish Lesson"]
    result = [to_do.done, to_do.title, to_do.description]
    assert_equal(expected, result)
  end

  def test_initial_to_s
    expected = "[ ] Item One"
    assert_equal(expected, to_do.to_s)
  end

  def test_done_undone
    result = []
    expected = ["[X] Item One", "[ ] Item One"]
    to_do.done!
    result << to_do.to_s
    to_do.undone!
    result << to_do.to_s
    assert_equal(expected, result)
  end
end
