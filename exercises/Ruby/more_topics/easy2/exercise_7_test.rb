require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise7Test < Minitest::Test
  attr_accessor :arr

  def setup
    @arr = [1, 3, 5]
  end

  def my_each_with_object(arr, obj)
    size = arr.size
    index = 0

    while index < size
      yield(arr[index], obj)
      index += 1
    end

    obj
  end

  def test_square_elements_of_an_array
    result = my_each_with_object(arr, []) do |value, list|
      list << value**2
    end
    assert_equal([1, 9, 25], result)
  end

  def test_creating_new_arrays
    expected = [
      [1],
      [1, 2, 3],
      [1, 2, 3, 4, 5]
    ]
    result = my_each_with_object(arr, []) do |value, list|
      list << (1..value).to_a
    end
    assert_equal(expected, result)
  end

  def test_hash_of_squares
    expected = { 1 => 1, 3 => 9, 5 => 25 }
    result = my_each_with_object(arr, {}) do |value, hash|
      hash[value] = value**2
    end
    assert_equal(expected, result)
  end

  def test_return_empty_hash
    result = my_each_with_object([], {}) do |value, hash|
      hash[value] = value**2
    end
    assert_equal({}, result)
  end
end
