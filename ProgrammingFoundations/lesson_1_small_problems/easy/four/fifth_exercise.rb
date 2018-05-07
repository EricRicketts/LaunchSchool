require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FifthExercise < Minitest::Test

=begin
Multiples of 3 and 5

Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number,
and then computes the sum of those multiples. For instance, if the supplied number is 20,
the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

Input: A number > 1
Output: A number

Algorithm:
  - (1..num).reduce
  - if (n % 3).zero? OR (n % 5).zero? then add the number to the total
Examples

multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168

=end

  def multisum(num)
    (1..num).reduce(0) {|sum, n| sum += (((n % 3).zero? || (n % 5).zero?) ? n : 0)}
  end

  def test_one
    assert_equal(3, multisum(3))
  end
  
  def test_two
    assert_equal(8, multisum(5))
  end
  
  def test_three
    assert_equal(33, multisum(10))
  end
  
  def test_four
    assert_equal(234168, multisum(1000))
  end
  
end