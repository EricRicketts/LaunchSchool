require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class MethodsTest < Minitest::Test

  def add_each_on_array(arr, adder=0)
    result = []
    idx = 0

    loop do
      break if idx >= arr.size
      result.push(arr[idx] + adder)
      idx += 1
    end

    result  
  end

  def odd_select(arr)
    result = []
    idx = 0

    loop do
      break if idx >= arr.size
      current_value = arr[idx]
      result << current_value if current_value.odd?
      idx += 1
    end

    result
  end

  def my_caps(arr)
    result = []
    idx = 0

    loop do
      break if idx >= arr.size
      word = arr[idx]
      result << word.capitalize
      idx += 1
    end

    result
  end

  def test_adder
    arr = (0..5).to_a
    result = add_each_on_array(arr, 2)
    expected = []
    arr.each {|n| expected << n + 2}
    assert_equal(expected, result)
  end

  def test_select_odd
    arr = (1..10).to_a
    expected = arr.select {|n| n.odd?}
    assert_equal(expected, odd_select(arr))
  end

  def test_caps
    arr = %W(one two three)
    expected = arr.map {|word| word.capitalize}
    assert_equal(expected, my_caps(arr))
  end
  
end