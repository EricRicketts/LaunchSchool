require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class SixthExercise < Minitest::Test

=begin
Combining Arrays

Write a method that takes two Arrays as arguments, and returns an Array that contains
all of the values from the argument Arrays. There should be no duplication of values
in the returned Array, even if there are duplicates in the original Arrays.

Example

merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

it turns out my solution was the LS solution
=end

  def merge(ary1, ary2)
    ary1 | ary2
  end

  def test_1
    # skip
    expected = [1, 3, 5, 6, 9]
    result = merge([1, 3, 5], [3, 6, 9])
    assert_equal(expected, result)
  end 

end