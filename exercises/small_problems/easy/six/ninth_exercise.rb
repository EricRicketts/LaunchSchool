require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class NinthExercise < Minitest::Test

=begin
Does My List Include This?

Write a method named include? that takes an Array and a search value as arguments.
This method should return true if the search value is in the array, false if it is not.
You may not use the Array#include? method in your solution.

include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false
=end

  def include?(ary, elem)
    last_index = ary.length - 1
    0.upto(last_index) do |idx|
      return true if ary[idx] == elem
    end
    false
  end

  def test_1
    # skip
    assert(include?([1,2,3,4,5], 3))      
  end

  def test_2
    # skip
    refute(include?([1,2,3,4,5], 6))      
  end

  def test_3
    # skip
    refute(include?([], 3))      
  end

  def test_4
    # skip
    assert(include?([nil], nil))      
  end

  def test_5
    # skip
    refute(include?([], nil))      
  end

end

class NinthExerciseLS < Minitest::Test

=begin
Again it helps to know the array, hash
and enumerable methods
=end

  def include?(ary, elem)
    !!ary.find_index(elem)
  end

  def test_1
    # skip
    assert(include?([1,2,3,4,5], 3))      
  end

  def test_2
    # skip
    refute(include?([1,2,3,4,5], 6))      
  end

  def test_3
    # skip
    refute(include?([], 3))      
  end

  def test_4
    # skip
    assert(include?([nil], nil))      
  end

  def test_5
    # skip
    refute(include?([], nil))      
  end
  
end