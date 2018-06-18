require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Sum Square - Square Sum

Write a method that computes the difference between the square of the sum
of the first n positive integers and the sum of the squares of the first
n positive integers.

Examples:

sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150

AL:
  - one sum generates square of sums
  - one sum generates sum of square
  - take difference between the two
=end

class TenthExercise < Minitest::Test

  def sum_square_difference(n)
    arr = (1..n).to_a 
    square_of_sum = arr.inject(&:+).pow(2)
    sum_of_squares = arr.inject(0) {|sum, n| sum += n.pow(2)}
    square_of_sum - sum_of_squares
  end

  def test_0
    # skip
    assert_equal(22, sum_square_difference(3))
  end
  
  def test_1
    # skip
    assert_equal(2640, sum_square_difference(10))
  end
  
  def test_2
    # skip
    assert_equal(0, sum_square_difference(1))
  end
  
  def test_3
    # skip
    assert_equal(25164150, sum_square_difference(100))
  end
  
end