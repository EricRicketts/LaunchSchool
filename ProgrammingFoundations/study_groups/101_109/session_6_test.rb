require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class Session6 < Minitest::Test

=begin
# Write a method named include? that takes an Array and a search value as
# arguments. This method should return true if the search value is in the array,
# false if it is not. You may not use the Array#include? method in your solution.

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
=end

  def include?(ary, elem)
    ary.each do |e|
      return true if e == elem
    end
    false
  end

  def test_1
    assert(include?([1,2,3,4,5], 3))      
  end

  def test_2
    assert(include?([nil], nil))
  end

  def test_3
    refute(include?([1,2,3,4,5], 6))
  end

  def test_4
    refute(include?([], 3))
  end

  def test_5
    refute(include?([], nil))    
  end

end

=begin
# Write a method that computes the difference between the square of the sum of
# the first n positive integers and the sum of the squares of the first n positive
# integers.

# Examples:


I: number
O: number

AL:
  - first convert the number to an array
  - compute first square
    - sum the numbers in the array, then square it
  - compuute the seconds quare
    - square each number and add one number to another
  - I take the difference between the squares

  def sum_square_difference(num)
    ary = (1..num).to_a
    first_sum = ary.sum
    first_square = first_sum**2
    second_square = ary.inject(0) {|sum, n| sum += n**2}
    first_square - second_square
  end


p sum_square_difference(3) == 22
# p sum_square_difference(3)
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
=end

class Session6NextProblem < Minitest::Test

  def sum_square_difference(num)
    ary = (1..num).to_a
    (ary.sum)**2 - ary.inject {|sum, n| sum += n**2}
  end

  def test_1
    assert_equal(22, sum_square_difference(3))
  end
  
  def test_2
    assert_equal(2640, sum_square_difference(10))
  end
  
  def test_3
    assert_equal(0, sum_square_difference(1))
  end
  
  def test_4
    assert_equal(25164150, sum_square_difference(100))
  end
  
end
