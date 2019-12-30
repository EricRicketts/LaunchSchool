require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FifthExercise < Minitest::Test

=begin
Squaring An Argument

Using the multiply method from the "Multiplying Two Numbers" problem,
write a method that computes the square of its argument
(the square is the result of multiplying a number by itself).

Example:

square(5) == 25
square(-8) == 64
=end

  def multiply(n1, n2)
    n1 * n2
  end

  def square(n)
    multiply(n, n)
  end

  def power(num, power)
    result = 1
    power.times do
      result = result*multiply(num, 1)
    end
    result    
  end

  def test_one
    assert(9, square(3))
  end
  
  def test_two
    assert(64, square(-8))
  end

  def test_three
    assert(27, power(3, 3))
  end

  def test_four
    assert(-32768, power(-8, 5))
  end
  
end