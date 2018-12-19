require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise8Test < Minitest::Test
  attr_accessor :arr

  def setup
    @arr = [1, 5, 3]
  end

  def my_max_by(arr)
    size = arr.size
    index = 0
    max = arr.empty? ? nil : arr[index]
    block_max = yield(arr[index]) unless arr.empty?

    while index < size
      tmp = yield(arr[index])
      max, block_max = arr[index], yield(arr[index]) if tmp > block_max
      index += 1
    end

    max
  end

  def test_increase_by_two
    result = my_max_by(arr) { |value| value + 2 }
    assert_equal(5, result)
  end

  def test_subtract_from_nine
    result = my_max_by(arr) { |value| 9 - value }
    assert(1, result)
  end

  def test_with_characters
    result = my_max_by(arr) { |value| (96 - value).chr }
    assert(1, result)
  end

  def test_with_array_sizes
    result = my_max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size }
    assert_equal([3, 4, 5], result)
  end

  def test_one_value
    result = my_max_by([-7]) { |value| value * 3 }
    assert_equal(-7, result)
  end

  def test_empty_array
    result = my_max_by([]) { |value| value + 5 }
    assert_nil(result)
  end
end
