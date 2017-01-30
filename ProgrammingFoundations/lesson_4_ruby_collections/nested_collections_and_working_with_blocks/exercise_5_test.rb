require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class Exercise5Test < Minitest::Test
  def test_sort_sub_arrays
    arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
    expected = [['c', 'b', 'a'], [3, 2, 1], ['green', 'blue', 'black']]
    result = arr.map do |sub_array|
      sub_array.sort do |a, b|
        b <=> a
      end
    end
    assert_equal expected, result
  end
end