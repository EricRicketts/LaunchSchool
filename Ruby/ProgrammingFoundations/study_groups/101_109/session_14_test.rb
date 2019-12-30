require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Session14TestFirstProblem < Minitest::Test

# Given a divisor and a bound, find the largest integer N, such that:
# -- N is divisible by divisor
# -- N is less than or equal to bound
# -- N is greater than 0.

# Notes:
# -- The parameters(divisor, bound) passed to the method will only be positive values.
# -- A divisor should always be found.

# p max_multiple(2,7) == 6
# p max_multiple(3,10) == 9
# p max_multiple(7,17) == 14
# p max_multiple(10,50) == 50 

  def max_multiple(divisor, number)
    (divisor..number).select { |n| (n % divisor).zero? }.max     
  end

  def test_1
    # skip
    assert_equal(6, max_multiple(2, 7))     
  end
 
  def test_2
    # skip
    assert_equal(9, max_multiple(3, 10))     
  end
 
  def test_3
    # skip
    assert_equal(14, max_multiple(7, 17))     
  end
 
  def test_4
    # skip
    assert_equal(50, max_multiple(10, 50))     
  end
 
end

class Session14TestSecondProblem < Minitest::Test

=begin

Demonstration, with Cuisenaire rods, of the abundance of the number 12
In number theory, an abundant number or excessive number is a number for which the sum of its
proper divisors is greater than the number itself. The integer 12 is the first abundant number.
Its proper divisors are 1, 2, 3, 4 and 6 for a total of 16. The amount by which the sum exceeds
the number is the abundance. The number 12 has an abundance of 4, for example.

The first 28 abundant numbers are:

12, 18, 20, 24, 30, 36, 40, 42, 48, 54, 56, 60, 66, 70, 72, 78, 80, 84, 88, 90, 96, 100, 102, 104, 108, 112, 114, 120
=end

  def abundant_number?(number)
    (1...number).select { |n| (number % n).zero? }.sum > number
  end

  def test_1
    # skip
    assert(abundant_number?(12))
  end
  
  def test_2
    # skip
    assert(abundant_number?(18))
  end
  
  def test_3
    # skip
    assert(abundant_number?(36))
  end
  
  def test_4
    # skip
    refute(abundant_number?(50))
  end
  
  def test_5
    # skip
    refute(abundant_number?(92))
  end
  
  def test_6
    # skip
    assert(abundant_number?(120))
  end
  
end

class Session14TestThirdProblem < Minitest::Test

=begin
# Positive integers that are divisible exactly by the sum of their digits are called Harshad numbers. The first few
Harshad numbers are: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 18, ...

# We are interested in Harshad numbers where the product of its digit sum s and s with the digits reversed, gives
the original number n. For example consider number 1729:

# its digit sum, s = 1 + 7 + 2 + 9 = 19
# reversing s = 91
# and 19 * 91 = 1729 --> the number that we started with.
# Complete the function which tests if a positive integer n is Harshad number, and returns True if the product of
its digit sum and its digit sum reversed equals n; otherwise return False.
=end

  def number_joy(number)
    sum_of_digits = number.digits.sum
    return false unless (number % sum_of_digits).zero?
    sum_of_digits * sum_of_digits.to_s.reverse.to_i == number
  end

  def test_1
    # skip
    refute(number_joy(1997))
  end

  def test_2
    # skip
    refute(number_joy(1998))
  end

  def test_3
    # skip
    assert(number_joy(1729))   
  end

  def test_4
    # skip
    refute(number_joy(18))
  end

  def test_5
    # skip
    assert(number_joy(81))
  end

  def test_6
    # skip
    assert(number_joy(1458))
  end

end

class Session14TestFourthProblem < Minitest::Test

=begin
# An element in an array is dominant if it is greater than all elements to its right. You will be
# given an array and your task will be to return a list of all dominant elements. For example:

# solve([1,21,4,7,5]) = [21,7,5] because 21, 7 and 5 are greater than elments to their right.
# solve([5,4,3,2,1]) = [5,4,3,2,1]

# Notice that the last element is always included.

p solve([16,17,14,3,14,5,2]) == [ 17,14,5,2]
p solve([ 92,52,93,31,89,87,77,105]) == [105]
p solve([ 75,47,42,56,13,55]) == [75,56,55]
p solve([ 67,54,27,85,66,88,31,24,49]) == [88,49]

I: array
O: array
AL:
  - do a select operation
    - take the current number
    - form an array with the next number in the array to the end of the array
      - select if number > each number in remaining array
      - if we get to the last number just add it to the answer
=end

  def solve(numbers)
    last_idx = numbers.size - 1
    numbers.select.with_index do |num, idx|
      idx == last_idx ? true : numbers[idx + 1..-1].all? { |n| num > n }
    end    
  end

  def test_1
    # skip
    assert_equal([17, 14, 5, 2], solve([16, 17, 14, 3, 14, 5, 2]))
  end

  def test_2
    # skip
    assert_equal([105], solve([92, 52, 93, 31, 89, 87, 77, 105]))
  end

  def test_3
    # skip
    assert_equal([75, 56, 55], solve([75, 47, 42, 56, 13, 55]))
  end
  
  def test_4
    # skip
    assert_equal([88, 49], solve([67, 54, 27, 85, 66, 88, 31, 24, 49]))
  end
  
end