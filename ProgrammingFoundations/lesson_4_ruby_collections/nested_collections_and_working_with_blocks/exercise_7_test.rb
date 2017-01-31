require 'minitest/autorun'
require 'minitest/pride'

class Exercise7Test < Minitest::Test
  def test_multiples_of_three
    arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
    expected = [[], [3], [9], [15]]
    result = arr.map do |sub_array|
      sub_array.select do |num|
        num % 3 == 0
      end
    end
    assert_equal expected, result
  end
end