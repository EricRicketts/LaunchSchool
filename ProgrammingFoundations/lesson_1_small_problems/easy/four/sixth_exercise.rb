require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class SixthExercise < Minitest::Test

=begin
Running Totals

Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

Examples:

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

Input: an array of integers
Output: an array of integers

Algorithm:
  - initialize the sum to zero
  - if there is one number put that number into an array
  - take the current sum and add the current number to it

=end

  def running_total(arr)
    sum = 0
    arr.map {|n| sum += n}
  end

  def test_one
    assert_equal([2, 7, 20], running_total([2, 5, 13]))
  end
  
  def test_two
    assert_equal([14, 25, 32, 47, 67], running_total([14, 11, 7, 15, 20]))
  end
  
  def test_three
    assert_equal([3], running_total([3]))
  end
  
  def test_four
    assert_equal([], running_total([]))
  end
  
end

class SixthExerciseInject < Minitest::Test

  def running_total(arr)
    sum = 0
    arr.inject([]) {|sum_ary, n| sum_ary.push(sum += n) }
  end

  def test_one
    assert_equal([2, 7, 20], running_total([2, 5, 13]))
  end
  
  def test_two
    assert_equal([14, 25, 32, 47, 67], running_total([14, 11, 7, 15, 20]))
  end
  
  def test_three
    assert_equal([3], running_total([3]))
  end
  
  def test_four
    assert_equal([], running_total([]))
  end  
  
end