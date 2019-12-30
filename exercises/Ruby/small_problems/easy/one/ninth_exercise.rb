require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class NinthExercise < Minitest::Test

=begin
Sum Of Digits

Write a method that takes one argument, a positive integer, and returns the sum of its digits.

Examples:

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
The tests above should print true.

For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).

Input: A positive integer is guaranteed to be the input
Output: A number which is the sum of each of the input number's digits

DS: Convert the number into an array of digits

Algorithm:
  - split the number into its digits using #digits
  - add up the numbers using reduce
=end

  def sum(int)
    int.digits.reduce(:+)
  end

  def test_one
    assert_equal(5, sum(23))
  end
  
  def test_two
    assert_equal(19, sum(496))
  end
  
  def test_three
    assert_equal(45, sum(123_456_789))
  end
  
end