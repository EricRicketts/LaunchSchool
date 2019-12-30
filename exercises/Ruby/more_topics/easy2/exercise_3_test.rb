require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise3Test < Minitest::Test
  attr_accessor :arr

  def setup
    @arr = ('a'..'d').to_a
  end

  def my_map(arr)
    size = arr.size
    index = 0
    result = []

    while index < size
      result.push(yield(arr[index]))
      index += 1
    end

    result
  end

  def test_simple_map
    expected = [1, 9, 36]
    result = my_map([1, 3, 6]) { |value| value**2 }
    assert_equal(expected, result)
  end

  def test_empty_array
    result = my_map([]) { |value| true }
    assert_equal([], result)
  end

  def test_all_false
    expected = Array.new(4, false)
    result = my_map(arr) { |value| false }
    assert_equal(expected, result)
  end

  def test_upcase_letters
    expected = ('A'..'D').to_a
    result = my_map(arr) { |value| value.upcase }
    assert_equal(expected, result)
  end

  def test_mapping_to_arrays
    expected = [
      [1], [1, 2, 3], [1, 2, 3, 4]
    ]
    result = my_map([1, 3, 4]) { |value| (1..value).to_a }
    assert_equal(expected, result)
  end
end
