require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Create a method that takes two integers as arguments. The first argument is a count,
and the second is the first number of a sequence that your method will create.
The method should return an Array that contains the same number of elements as the
count argument, while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater,
while the starting number can be any integer value. If the count is 0, an empty
list should be returned.

Examples:

sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

AL:
  - create an empty array
  - init sum = 0
  - interate n times
    sum += sequence step
=end

class ExerciseEight < Minitest::Test

  def sequence(total, interval)
    (1..total).map {|n| n*interval}
  end

  def test_0
    # skip
    expected = (1..5).to_a
    result = sequence(5, 1)
    assert_equal(expected, result)
  end
  
  def test_1
    # skip
    expected = [-7, -14, -21, -28]
    result = sequence(4, -7)
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = Array.new(3, 0)
    result = sequence(3, 0)
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = []
    result = sequence(0, 1000000)
    assert_equal(expected, result)
  end
  
end