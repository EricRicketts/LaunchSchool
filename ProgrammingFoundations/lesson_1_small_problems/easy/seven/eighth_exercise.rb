=begin
Multiply Lists

Write a method that takes two Array arguments in which each Array contains
a list of numbers, and returns a new Array that contains the product of each
pair of numbers from the arguments that have the same index. You may assume
that the arguments contain the same number of elements.

Examples:

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class EighthExercise < Minitest::Test
  # this turned out to be the Further Exploration Exercise
  def multiply_list(arr1, arr2)
    arr1.zip(arr2).map {|pair| pair.first * pair.last}
  end

  def test_1
    expected = [27, 50, 77]
    result = multiply_list([3, 5, 7], [9, 10, 11])
    assert_equal(expected, result)
  end
  
end

class EighthExerciseAltSol < Minitest::Test

  def multiply_list(arr1, arr2)
    last_index = arr1.length - 1
    result = []
    0.upto(last_index) do |idx|
      result.push(arr1[idx] * arr2[idx])
    end
    result
  end

  def test_1
    expected = [27, 50, 77]
    result = multiply_list([3, 5, 7], [9, 10, 11])
    assert_equal(expected, result)
  end
  
end