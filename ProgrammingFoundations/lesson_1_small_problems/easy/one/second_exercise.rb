require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class SecondExercise < Minitest::Test

=begin
Write a method that takes one integer argument, which may be positive, negative, or zero.
This method return true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

Examples:

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
Keep in mind that you're not allowed to use #odd? or #even? in your solution.


Input: Integer, positive, negative, or zero
Output: Boolean

Algorithm: if number % 2 is not zero then the number is odd
=end

  def is_odd?(n)
    !(n % 2).zero?
  end

  def is_odd_v2?(n)
    !(n.remainder(2)).zero?
  end

  def test_true_cases
    assert([5, -17, 7].all? {|n| is_odd?(n)})
  end
  
  def test_false_cases
    assert([2, -8, 0].none? {|n| is_odd?(n)})
  end
  
  def test_true_cases_v2
    assert([5, -17, 7].all? {|n| is_odd_v2?(n)})
  end
  
  def test_false_cases_v2
    assert([2, -8, 0].none? {|n| is_odd_v2?(n)})
  end
  
end