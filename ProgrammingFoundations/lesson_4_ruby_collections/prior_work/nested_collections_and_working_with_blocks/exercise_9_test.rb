require 'minitest/autorun'
require 'minitest/pride'

class Exercise9Test < Minitest::Test
  def test_order_by_odd
    arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
    expected = [[1, 8, 3], [1, 6, 7], [1, 4, 9]]
    result = arr.sort_by do |sub_array|
      sub_array.map do |num|
        num if num.odd? # this is not good because map
        # should not have a conditional in it
      end
    end
    assert_equal expected, result
  end

  def test_order_by_odd_better_way
    arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
    expected = [[1, 8, 3], [1, 6, 7], [1, 4, 9]]
    result = arr.sort_by do |sub_array|
      sub_array.select do |num|
        num.odd?
      end
    end
    assert_equal expected, result
  end
end