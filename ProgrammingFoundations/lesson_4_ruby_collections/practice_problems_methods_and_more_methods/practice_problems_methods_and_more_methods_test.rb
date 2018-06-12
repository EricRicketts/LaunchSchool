require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class PracticeProblemsMethodsAndMoreMethodsTest < Minitest::Test

  def test_1
    # returns [1, 2, 3] because the return value for 'hi' is
    # truthy for each element in the array so each element in
    # the array is selected
    result = [1, 2, 3].select do |num|
      num > 5
      'hi'
    end
    assert_equal([1, 2, 3], result)
  end

  def test_2
    # according to the Ruby documentation, Array#count will count
    # the number of elements which pass the boolean condition
    result = ['ant', 'bat', 'caterpillar'].count do |word|
      word.length < 4
    end
    assert_equal(2, result)
  end

  def test_3
    # since the return value for #puts is nil and reject captures values
    # based on a falsy conditions each element of the array will be falsey
    # so the original array will be returned. The return value would be [1, 2, 3]
    result = []
    assert_output("1\n2\n3\n") { result = [1, 2, 3].reject {|num| puts num} }
    assert_equal([1, 2, 3], result)
  end

  def test_4
    # each_with_object will iterate through the array of strings and then populate
    # the empty hash that was passed to it.  This empty hash is the argument to
    # each_with_object and is in the block variable hash.  value is the string and
    # value[0] is the first letter of the string so the keys for the hash will be
    # the first letters of each string and the values will be the string associated
    # with the first letter
    result = ['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
      hash[value[0]] = value
    end
    expected = {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}
    assert_equal(expected, result)
  end
  
end