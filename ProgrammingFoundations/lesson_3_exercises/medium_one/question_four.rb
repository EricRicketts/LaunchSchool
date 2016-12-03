require 'minitest/autorun'
require 'minitest/pride'

# What happens when we modify an array while we are
# iterating over it? What would be output by this code?
class QuestionFour < Minitest::Test
  def test_mutate_array_shfit
    numbers = [1, 2, 3, 4]
    output = capture_io do
      numbers.each do |number|
        p number
        numbers.shift(1)
      end
    end
    assert_equal ["1\n3\n", ""], output
    assert_equal [3, 4], numbers
=begin
numbers#each starts at index 0 and in the block it outputs
1 which is at index 0, but then a shift occurs which mutates
the array to [2, 3, 3] as #each advances to the next index,
which is index 1 instead of being at 2 it is now at 3, since
the array is one element shorter, so it outputs 3.  Another
shift occurs and the array is now [3, 4], but now the index
has advanced to 2 but there are only two elements in the array,
which mean only indices 0 and 1 exist.  Thus the code breaks out
of the iterator having printed 1 and 3, but the array is now [3, 4]
=end
  end

# What would be output by this code?
  def test_mutate_array_pop
    numbers = [1, 2, 3, 4]
    output = capture_io do
      numbers.each do |number|
        p number
        numbers.pop(1)
      end
    end
    assert_equal ["1\n2\n", ""], output
    assert_equal [1, 2], numbers
=begin
this follows the same pattern as the last example but since
elements are take from the back end of the array, the first
two p statement do print the first two elements of the array.
after 2 pop operations the array index exceeds the index of
the last element in the array.
=end
  end
end