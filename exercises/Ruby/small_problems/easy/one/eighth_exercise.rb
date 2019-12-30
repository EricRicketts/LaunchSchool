require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Array Average

Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers.

Examples:

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
The tests above should print true.

Input: guaranteed to a non-empty array of positive integers
Output: average of numbers in the array

Questions: Float output?  Looks like integer output is required

DS: take the array as given

Alogrithm:
  - use reduce to add up the numbers
  - divide by the length of the array
=end

class EighthExercise < Minitest::Test

  def average(ary)
    ary.reduce(:+) / ary.length
  end

  def test_one
    assert_equal(25, average([1, 5, 87, 45, 8, 8]))
  end
  
  def test_two
    assert_equal(40, average([9, 47, 23, 95, 16, 52]))
  end
  
end