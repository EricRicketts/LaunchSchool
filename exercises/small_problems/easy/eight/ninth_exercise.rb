=begin
Convert number to reversed array of digits

Write a method that takes a positive integer as an argument and
returns that number with its digits reversed. Examples:

reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # Note that zeros get dropped!
reversed_number(1) == 1

AL:
  - convert to an array of characters
  - manually reverse the characters
    - -1.downto(-array.length)
      - reverse_string << array[index]
  - find the first non-zero digit
  - delete all of the zeroes up to the
  non-zero digit
=end
require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class NinthExerciseManual < Minitest::Test

  def reversed_number(number)
    str_ary = number.to_s.chars
    length = -str_ary.length
    result = ''
    -1.downto(length) do |idx|
      result << str_ary[idx]
    end
    number_of_leading_zeros = result.index(/[1-9]/)
    result.slice!(0, number_of_leading_zeros)
    result.to_i   
  end

  def test_0
    # skip
    assert_equal(54321, reversed_number(12345))
  end
  
  def test_1
    # skip
    assert_equal(31221, reversed_number(12213))
  end
  
  def test_2
    # skip
    assert_equal(654, reversed_number(456))
  end
  
  def test_3
    # skip
    assert_equal(21, reversed_number(12000))
  end
  
  def test_4
    # skip
    assert_equal(1, reversed_number(1))
  end
  
  def test_5
    # skip
    assert_equal(540021, reversed_number(12004500))
  end
  
end

class NinthExercise < Minitest::Test

  def reversed_number(number)
    number.to_s.reverse.to_i
  end

  def test_0
    # skip
    assert_equal(54321, reversed_number(12345))
  end
  
  def test_1
    # skip
    assert_equal(31221, reversed_number(12213))
  end
  
  def test_2
    # skip
    assert_equal(654, reversed_number(456))
  end
  
  def test_3
    # skip
    assert_equal(21, reversed_number(12000))
  end
  
  def test_4
    # skip
    assert_equal(1, reversed_number(1))
  end
  
  def test_5
    # skip
    assert_equal(540021, reversed_number(12004500))
  end
  
end