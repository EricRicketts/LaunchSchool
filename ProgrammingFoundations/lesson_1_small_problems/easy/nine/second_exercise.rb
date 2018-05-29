=begin
Double Doubles

A double number is a number with an even number of digits whose left-side digits
are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676
are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless
the argument is a double number; double numbers should be returned as-is.

Examples:

twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10

Note: underscores are used for clarity above. Ruby lets you use underscores
when writing long numbers; however, it does not print the underscores when
printing long numbers. Don't be alarmed if you don't see the underscores when
running your tests.

AL:
  - if the number is a double number return the number
    - number must have even # of digits, if odd return the number*2
    - partition number into 2 parts
    - first part == second part
  - else return 2*number
=end
require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class SecondExercise < Minitest::Test

  def twice(number)
    str_ary = number.to_s.chars
    center_idx = str_ary.length / 2
    left, right = str_ary.partition.with_index {|_, idx| idx < center_idx}
    left == right ? number : number*2
  end

  def test_0
    # skip
    assert_equal(74, twice(37))
  end
  
  def test_1
    # skip
    assert_equal(44, twice(44))
  end
  
  def test_2
    # skip
    assert_equal(668866, twice(334433))
  end
  
  def test_3
    # skip
    assert_equal(888, twice(444))
  end
  
  def test_4
    # skip
    assert_equal(214, twice(107))
  end
  
  def test_5
    # skip
    assert_equal(103103, twice(103103))
  end
  
  def test_6
    # skip
    assert_equal(3333, twice(3333))
  end
  
  def test_7
    # skip
    assert_equal(7676, twice(7676))
  end
  
  def test_8
    # skip
    assert_equal(123_456_789_123_456_789, twice(123_456_789_123_456_789))
  end
  
  def test_9
    # skip
    assert_equal(10, twice(5))
  end
  
end

class SecondExerciseLS < Minitest::Test

  # LS thought about the problem more and considered
  # the edge case where there is a single character
  # note if there is a single digit => center.zero?
  # then a blank string is returned making the comparison
  # left_side == right_side false
=begin
Note that there is an edge case for single digit numbers;
in this case, center is calculated as 0. If we don't pay
attention to this case, we end up setting both left_side
and right_side to string_number[0..-1], which, in the case
of a single character string, is equal to that character.
=end

  def twice(number)
    string_number = number.to_s
    center = string_number.size / 2
    left_side = center.zero? ? '' : string_number[0..center - 1]
    right_side = string_number[center..-1]

    return number if left_side == right_side
    return number * 2
  end

  def test_0
    # skip
    assert_equal(74, twice(37))
  end
  
  def test_1
    # skip
    assert_equal(44, twice(44))
  end
  
  def test_2
    # skip
    assert_equal(668866, twice(334433))
  end
  
  def test_3
    # skip
    assert_equal(888, twice(444))
  end
  
  def test_4
    # skip
    assert_equal(214, twice(107))
  end
  
  def test_5
    # skip
    assert_equal(103103, twice(103103))
  end
  
  def test_6
    # skip
    assert_equal(3333, twice(3333))
  end
  
  def test_7
    # skip
    assert_equal(7676, twice(7676))
  end
  
  def test_8
    # skip
    assert_equal(123_456_789_123_456_789, twice(123_456_789_123_456_789))
  end
  
  def test_9
    # skip
    assert_equal(10, twice(5))
  end
  
end

class SecondExerciseZacKlammer < Minitest::Test
=begin
an extremly clever and efficient solution, let us take
the number 3333 so num.digits.size/2 = 2 so we end up
dividing the number by 10**2 or 100.  So if we divide
a number by 1 power of ten less than the highest power
of the number (in this case) the we split the number down
the center, so to speak.  This is because 100 3300 33 times
and 33 / 100 = 0 remainder 33.  No conversion to a string
is necessary.
=end

  def twice(num)
    left, right = num.divmod(10**(num.digits.size / 2))
    left == right ? num : num * 2
  end

  def test_0
    # skip
    assert_equal(74, twice(37))
  end
  
  def test_1
    # skip
    assert_equal(44, twice(44))
  end
  
  def test_2
    # skip
    assert_equal(668866, twice(334433))
  end
  
  def test_3
    # skip
    assert_equal(888, twice(444))
  end
  
  def test_4
    # skip
    assert_equal(214, twice(107))
  end
  
  def test_5
    # skip
    assert_equal(103103, twice(103103))
  end
  
  def test_6
    # skip
    assert_equal(3333, twice(3333))
  end
  
  def test_7
    # skip
    assert_equal(7676, twice(7676))
  end
  
  def test_8
    # skip
    assert_equal(123_456_789_123_456_789, twice(123_456_789_123_456_789))
  end
  
  def test_9
    # skip
    assert_equal(10, twice(5))
  end
  
end