=begin
Counting Up
Write a method that takes an integer argument,
and returns an Array of all integers, in sequence,
between 1 and the argument.

You may assume that the argument will always be
a valid integer that is greater than 0.

Examples:

sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]
=end
require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FourthExercise < Minitest::Test

  def sequence(num)
    1.upto(num).to_a
  end

  def test_0
    # skip
    expected = [1, 2, 3, 4, 5]
    result = sequence(5)
    assert_equal(expected, result)
  end
  
  def test_1
    # skip
    expected = [1, 2, 3]
    result = sequence(3)
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = [1]
    result = sequence(1)
    assert_equal(expected, result)
  end
  
end

class FourthExerciseLS < Minitest::Test

  def sequence(num)
    (1..num).to_a
  end

  def test_0
    # skip
    expected = [1, 2, 3, 4, 5]
    result = sequence(5)
    assert_equal(expected, result)
  end
  
  def test_1
    # skip
    expected = [1, 2, 3]
    result = sequence(3)
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = [1]
    result = sequence(1)
    assert_equal(expected, result)
  end
  
end

class FourthExerciseFurtherExploration < Minitest::Test

  def sequence(num)
    num < 1 ? num.upto(1).to_a : 1.upto(num).to_a
  end

  def test_0
    # skip
    expected = [1, 2, 3, 4, 5]
    result = sequence(5)
    assert_equal(expected, result)
  end
  
  def test_1
    # skip
    expected = [1, 2, 3]
    result = sequence(3)
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = [1]
    result = sequence(1)
    assert_equal(expected, result)
  end

  def test_3
    # skip
    expected = [-3, -2, -1, 0, 1]
    result = sequence(-3)
    assert_equal(expected, result)
  end
  
end