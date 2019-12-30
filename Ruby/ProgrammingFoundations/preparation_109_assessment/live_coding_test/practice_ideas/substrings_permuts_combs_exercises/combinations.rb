require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Combinations < Minitest::Test

=begin
I: combination size, array
O: array of combnations
E:
[[1], [2], [3], [4]]
[[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
[[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]
AL:
  - start with an empty array
  - start with the current number in the array and the current index
    - take the case for size = 2; current_index + (size - 1)
      - indexes [0, 1], [0, 2], [0, 3] => last index = [1, 2, 3]
        - slice[0..(0 + 2 - 1)] => join [1] and [2]
        - slice[0..(1 + 2 - 1)] => join [1] and [3]
        - slice[0..(2 + 2 - 1)] -> join[1] and [4]
      - indexes [1, 2], [1, 3] => last index = [2, 3]
      - indexes [2, 3]
=end

  def setup
    @arr1 = [1, 2, 3, 4]
    @arr2 = [1, 2, 3, 4, 5, 6]
  end

  def combination(size, arr)
    combinations = []
    arr.each.with_index do |n, idx|

    end
  end

  def test_1
    skip
    expected = [[1], [2], [3], [4]]
    assert_equal(expected, combination(1, @arr1))
  end

  def test_2
    skip
    expected = [[]]
    assert_equal(expected, combination(0, @arr1))
  end

  def test_3
    skip
    expected = []
    assert_equal(expected, combination(5, @arr1))
  end

end
