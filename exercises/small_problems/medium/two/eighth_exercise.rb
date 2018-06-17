require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Next Featured Number Higher than a Given Value

A featured number (something unique to this exercise) is an odd number that is a multiple of 7,
and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is
not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number
that is greater than the argument. Issue an error message if there is no next featured number.

Examples:

featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # no possible number can fulfill this requirement

AL:
  - until the condition is met
    - increment the number
    - number must be odd
    - number must be divisible by 7
    - number must have all digits only appear once
=end

class EighthExercise < Minitest::Test

  def featured_number?(number)
    num_str_ary = number.to_s.chars
    number.odd? && (number % 7).zero? && num_str_ary == num_str_ary.uniq
  end

  def featured(number)
    featured_number_found = false
    featured_number = number
    until featured_number_found
      featured_number += 1
      featured_number_found = featured_number?(featured_number)
    end
    featured_number   
  end

  def test_0
    # skip
    assert_equal(21, featured(12))
  end
 
  def test_1
    # skip
    assert_equal(21, featured(20))
  end

  def test_2
    # skip
    assert_equal(35, featured(21))
  end

  def test_3
    # skip
    assert_equal(1029, featured(997))   
  end

  def test_4
    # skip
    assert_equal(1043, featured(1029))
  end

  def test_5
    # skip
    assert_equal(1_023_547, featured(999_999)) 
  end

  # def test_6
  #   skip # takes 45 seconds
  #   assert_equal(1_023_456_987, featured(999_999_987)) 
  # end

end


class EighthExerciseLS < Minitest::Test

=begin
LS solution accounts for excessively long
computational time, very clever

AL:
  - find first odd and divisible by 7 number
=end

  def odd_and_divisible_by_seven?(number)
    number.odd? && (number % 7).zero?
  end

  def unique_digits?(number)
    num_str_ary = number.to_s.chars
    num_str_ary == num_str_ary.uniq
  end

  def featured(number)
    if number > 999_999_987
      return "A featured number cannot be found beyond this number."
    end
    pre_number = number
    odd_and_divisible_by_seven_found = false
    until odd_and_divisible_by_seven_found
      pre_number += 1
      odd_and_divisible_by_seven_found = odd_and_divisible_by_seven?(pre_number) 
    end

    featured_number_found = false
    featured_number = pre_number
    return featured_number if unique_digits?(featured_number)

    until featured_number_found
      featured_number += 14
      featured_number_found = unique_digits?(featured_number)
    end
    featured_number   
  end

  def test_0
    # skip
    assert_equal(21, featured(12))
  end
 
  def test_1
    # skip
    assert_equal(21, featured(20))
  end

  def test_2
    # skip
    assert_equal(35, featured(21))
  end

  def test_3
    # skip
    assert_equal(1029, featured(997))   
  end

  def test_4
    # skip
    assert_equal(1043, featured(1029))
  end

  def test_5
    # skip
    assert_equal(1_023_547, featured(999_999)) 
  end

  def test_6
    # skip takes 6 seconds
    assert_equal(1_023_456_987, featured(999_999_987)) 
  end

  def test_7
    expected = "A featured number cannot be found beyond this number."
    assert_equal(expected, featured(9_999_999_999))
  end

end

