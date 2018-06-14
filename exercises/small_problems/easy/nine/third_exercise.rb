=begin
Always Return Negative

Write a method that takes a number as an argument. If the argument is a positive number,
return the negative of that number. If the number is 0 or negative, return the original number.

Examples;

negative(5) == -5
negative(-3) == -3
negative(0) == 0 
=end
require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class ThirdExercise < Minitest::Test

  def negative(num)
    -(num.abs)
  end

  def test_0
    # skip
    assert_equal(-5, negative(5))
  end
  
  def test_1
    # skip
    assert_equal(-3, negative(-3))
  end
  
  def test_2
    # skip
    assert_equal(0, negative(0))
  end
  
end

class ThirdExerciseLS < Minitest::Test
  # LS is more straight forward and probably more
  # readable
  def negative(num)
    num > 0 ? -num : num
  end

  def test_0
    # skip
    assert_equal(-5, negative(5))
  end
  
  def test_1
    # skip
    assert_equal(-3, negative(-3))
  end
  
  def test_2
    # skip
    assert_equal(0, negative(0))
  end
  
end