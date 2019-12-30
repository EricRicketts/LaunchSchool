require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class SeventhExercise < Minitest::Test

=begin
Odd Lists

Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

Examples:

oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []
=end

  def oddities(ary)
    ary.select.with_index {|elem, idx| idx.even? }
  end

  def test_one
    assert_equal([2, 4, 6], oddities([2, 3, 4, 5, 6]))
  end
  
  def test_two
    assert_equal(['abc'], oddities(['abc', 'def']))
  end
  
  def test_three
    assert_equal([123], oddities([123]))
  end
  
  def test_four
    assert_equal([], oddities([]))
  end
  
end

class SeventhExerciseV2 < Minitest::Test
  
  def oddities(ary)
    result = []
    last_idx = ary.length - 1
    for idx in (0..last_idx)
      result << ary[idx] if idx.even?
    end
    result
  end

  def test_one
    assert_equal([2, 4, 6], oddities([2, 3, 4, 5, 6]))
  end
  
  def test_two
    assert_equal(['abc'], oddities(['abc', 'def']))
  end
  
  def test_three
    assert_equal([123], oddities([123]))
  end
  
  def test_four
    assert_equal([], oddities([]))
  end

end

