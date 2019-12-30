require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise10Test < Minitest::Test
  attr_accessor :arr

  def setup
    @arr = [1, 3, 6, 10]
  end

  def my_each_cons(arr, range)
    size = arr.size
    begin_index = 0
    end_index = range - 1

    while end_index < size
      yield(*arr[begin_index..end_index])
      begin_index += 1
      end_index += 1
    end

    nil
  end

  def test_hash_all_true_values
    hash = {}
    expected = [
      { 1 => true, 3 => true, 6 => true, 10 => true },
      nil
    ]
    return_value = my_each_cons(arr, 1) do |value|
      hash[value] = true
    end
    assert_equal(expected, [hash, return_value])
  end

  def test_create_numeric_hash
    hash = {}
    expected = [
      { 1 => 3, 3 => 6, 6 => 10 },
      nil
    ]
    return_value = my_each_cons(arr, 2) do |value1, value2|
      hash[value1] = value2
    end
    assert_equal(expected, [hash, return_value])
  end

  def test_create_hash_with_array_values_step_3
    hash = {}
    expected = [
      { 1 => [3, 6], 3 => [6, 10] },
      nil
    ]
    return_value = my_each_cons(arr, 3) do |value1, *values|
      hash[value1] = values
    end
    assert_equal(expected, [hash, return_value])
  end

  def test_create_hash_with_array_values_step_4
    hash = {}
    expected = [
      { 1 => [3, 6, 10] },
      nil
    ]
    return_value = my_each_cons(arr, 4) do |value1, *values|
      hash[value1] = values
    end
    assert_equal(expected, [hash, return_value])
  end

  def test_range_larger_than_array_size
    hash = {}
    return_value = my_each_cons(arr, 5) do |value1, *values|
      hash[value1] = values
    end
    assert_equal([{}, nil], [hash, return_value])
  end
end