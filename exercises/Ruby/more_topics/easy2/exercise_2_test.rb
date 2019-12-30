require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise2Test < Minitest::Test

  def my_zip(arr1, arr2)
    result = []
    index = 0
    size = arr1.size

    while index < size
      elem1 = arr1[index]
      elem2 = arr2[index]
      result.push([elem1, elem2])
      index += 1
    end

    result
  end

  def test_two_arrays_of_same_size
    expected = [
      [1, 4], [2, 5], [3, 6]
    ]
    assert_equal(expected, my_zip([1, 2, 3], [4, 5, 6]))
  end

  def test_second_smaller_than_first
    expected = [
      [1, 1], [2, 2], [3, 3],
      [4, nil], [5, nil]
    ]
    assert_equal(expected, my_zip((1..5).to_a, (1..3).to_a))
  end

  def test_first_smaller_than_second
    expected = [
      [1, 4], [2, 5], [3, 6]
    ]
    assert_equal(expected, my_zip((1..3).to_a, (4..8).to_a))
  end
end
