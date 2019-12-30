require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise6Test < Minitest::Test
  attr_accessor :todo, :done

  def setup
    @todo = ['study', 'walk the dog', 'coffee with Tom']
    @done = ['apply sunscreen', 'go to the beach']
  end

  def move(n, from_array, to_array)
    to_array << from_array.shift
    move(n - 1, from_array, to_array)
  end

  def move_fix(n, from_array, to_array)
    return if n.zero?
    to_array << from_array.shift
    move_fix(n - 1, from_array, to_array)
  end

  def test_wrong_answer
    # we get a SystemStackError because the allocated memory
    # space for the program stack has been exceeded, this happens
    # because the program runs with no exit condition.  In this
    # case n keeps being decremented so one the from_array is empty
    # nil will forever be pushed onto the to_array
    assert_raises(SystemStackError) { move(2, todo, done) }
  end

  def test_fix
    # skip
    expected_done = ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']
    expected_todo = ['coffee with Tom']

    move_fix(2, todo, done)
    assert_equal([expected_done, expected_todo], [done, todo])
  end
end
