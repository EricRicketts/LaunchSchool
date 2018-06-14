require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Grocery List

Write a method which takes a grocery list (array) of fruits
with quantities and converts it into an array of the correct
number of each fruit.

Example:

buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
=end

class TenthExercise < Minitest::Test

  def buy_fruit(arr)
    fruit_ary = []
    arr.each do |fruit, count|
      1.upto(count) { fruit_ary.push(fruit) }
    end
    fruit_ary
  end

  def test_0
    expected = ["apples", "apples", "apples", "orange", "bananas","bananas"]
    result = buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])
    assert_equal(expected, result)
  end
  
end

class TenthExerciseLS < Minitest::Test
  # my original idea but I did not know about
  # array * integer
  def buy_fruit(arr)
    arr.map {|fruit, count| [fruit]*count}.flatten
  end

  def test_0
    expected = ["apples", "apples", "apples", "orange", "bananas","bananas"]
    result = buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])
    assert_equal(expected, result)
  end
  
end