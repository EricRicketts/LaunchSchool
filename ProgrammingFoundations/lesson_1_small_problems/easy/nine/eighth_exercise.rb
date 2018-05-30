require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Sequence Count

Create a method that takes two integers as arguments. The first argument is a count,
and the second is the first number of a sequence that your method will create.
The method should return an Array that contains the same number of elements as
the count argument, while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater,
while the starting number can be any integer value. If the count is 0, an empty
list should be returned.

Examples:

sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

AL:
  - start piont is second argument
  - end point is first argument * second argument
  - loop first arugment times
  - push onto array sum + increment which is second argument
=end

class EighthExercise < Minitest::Test

  def sequence(count, increment)
    seq_ary = []
    sum = 0
    i = 0
    while i < count
      sum += increment
      seq_ary.push(sum)
      i += 1 
    end
    seq_ary  
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
    expected = [0, 0, 0]
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

class EighthExerciseAlternateSolution < Minitest::Test
=begin
AL:
  - count will be the arrays size (1..count).to_a
  - map with increment * n
=end

  # this was the LS solution
  def sequence(count, increment)
    (1..count).to_a.map {|n| increment*n}
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
    expected = [0, 0, 0]
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