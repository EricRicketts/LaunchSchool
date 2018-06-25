require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Fix the Bug
The following code:

def my_method(array)
  if array.empty?
    []
  elsif
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])
is expected to print:

[]
[21]
[9, 16]
[25, 36, 49]
However, it does not. Obviously, there is a bug.
Find and fix the bug, then explain why the buggy program printed the results it did.


=end

class SixthExercise < Minitest::Test

  def my_method(arr)
    arr.map.with_index do |n, idx|
      arr.size == 1 ? n*7 : n*n
    end    
  end

  def test_1
    # skip
    assert_equal([], my_method([]))
  end
  
  def test_2
    # skip
    assert_equal([21], my_method([3]))
  end
  
  def test_3
    # skip
    assert_equal([9, 16], my_method([3, 4]))
  end
  
  def test_4
    # skip
    assert_equal([25, 36, 49], my_method([5, 6, 7]))
  end
  
end