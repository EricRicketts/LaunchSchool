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
end
