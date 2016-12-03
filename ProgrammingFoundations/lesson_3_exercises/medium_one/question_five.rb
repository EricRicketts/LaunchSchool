require 'minitest/autorun'
require 'minitest/pride'

# Alan wrote the following method, which was intended to show
# all of the factors of the input number:
# Alyssa noticed that this will fail if the input is 0, or a negative number,
# and asked Alan to change the loop. How can you change the loop construct
# (instead of using begin/end/until) to make this work? Note that we're not
# looking to find the factors for 0 or negative numbers, but we just want to
# handle it gracefully instead of raising an exception or going into an infinite loop.

# Bonus 1:  What is the purpose of the number % dividend == 0 ?
# Bonus 2:  What is the purpose of the second-to-last line in the method (the divisors before the method's end)?

class QuestionFive < Minitest::Test
  def factors(number)
    dividend = number
    divisors = []
    begin
      divisors << number / dividend if number % dividend == 0
      dividend -= 1
    end until dividend == 0
    divisors
  end

# Bonus 1 Answer: number % dividend == 0 sees if there is any remainder
# if there is no remainder than the dividend is a divisor of the number

# Bonus 2 Answer divisors stores the divisors of the number it is returned
# so the user can poentially use this array of divisors

  def factors_refactored(number)
    return "number must be greater than zero" unless number > 0
    dividend = number
    divisors = []
    until dividend.zero?
      divisors << number / dividend if (number % dividend).zero?
      dividend -= 1
    end
    divisors
  end

# below is the Launch School solution it is simpler in that
# only checks for a positive number and if the number is not
# positive it returns an empy array.  This is actually better
# in that an array is always returned, in my case I return
# a string or an array of numbers.  It is better interface
# design to always return an array of some kind
# instead, for user warning I could have a puts instead of return
# but again this might cause problems with whatever is calling
# the method, so the Launch School solution is better

# while dividend > 0 do
#   divisors << number / dividend if number % dividend == 0
#   dividend -= 1
# end

  def test_factors_positive_numbers
    assert_equal [1, 2, 3, 4, 6, 12], factors(12)
  end

  def test_zero_input
    assert_equal "number must be greater than zero", factors_refactored(0)
  end

  def test_negative_input
    assert_equal "number must be greater than zero", factors_refactored(-5)
  end

  def test_refactored_method
    assert_equal [1, 2, 3, 4, 6, 9, 12, 18, 36], factors_refactored(36)
  end
end
