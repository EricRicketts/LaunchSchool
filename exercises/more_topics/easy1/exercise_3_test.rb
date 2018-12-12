require 'minitest/autorun'
require 'minitest/reporters'
require 'pry-byebug'
Minitest::Reporters.use!

class Exercise3Test < Minitest::Test

  def missing(arr)
    (arr.first..arr.last).reject { |n| arr.include?(n) }
  end

  def test_missing_negatives_and_positives
    assert_equal([-1, 0, 2, 3, 4], missing([-3, -2, 1, 5]))
  end

  def test_all_numbers_present
    assert_empty(missing([1, 2, 3, 4]))
  end

  def test_simple_positive
    assert_equal([2, 3, 4], missing([1, 5]))
  end

  def test_simple_negative
    assert_equal([-4, -3, -2], missing([-5, -1]))
  end

  def test_one_number
    assert_empty(missing([6]))
  end
end