require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise9Test < Minitest::Test

  def my_each_cons(arr)
    size = arr.size
    index = 0

    while index < size - 1
      yield(arr[index], arr[index + 1])
      index += 1
    end

    nil
  end

  def test_create_numeric_hash
    hash = {}
    expected = [
      { 1 => 3, 3 => 6, 6 => 10 },
      nil
    ]
    return_value = my_each_cons([1, 3, 6, 10]) do |value1, value2|
      hash[value1] = value2
    end
    result = [hash, return_value]
    assert_equal(expected, result)
  end

  def test_empty_array
    hash = {}
    expected = [hash, nil]
    return_value = my_each_cons([]) do |value1, value2|
      hash[value1] = value2
    end
    assert_equal(expected, [hash, return_value])
  end

  def test_create_string_hash
    hash = {}
    expected = [
      { 'a' => 'b' },
      nil
    ]
    return_value = my_each_cons(['a', 'b']) do |value1, value2|
      hash[value1] = value2
    end
    assert_equal(expected, [hash, return_value])
  end
end