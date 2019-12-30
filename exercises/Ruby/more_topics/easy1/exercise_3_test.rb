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

class Exercise3TestVariationOne < Minitest::Test

  def missing(arr)
    (arr.first..arr.last).to_a - arr
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

class Exercise3TestLaunchSchool < Minitest::Test

  def missing(arr)
    arr.each_cons(2).each_with_object([]) do |pair, result|
      result.concat(((pair.first + 1)...pair.last).to_a)
    end
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

=begin
There needs to be an explanation of how the LS solution works, it is the way
I tried to solve the problem in the first place.  Actually, this is a variation
on the LS solution, I shortended it up a bit.

Let's take the first test the array is [-3, -2, 1, 5] the first pair is going
to be [-3, -2] to pair.first + 1 = -2 and ...pair.last is -3, so (-2...-3).to_a
is an empty array which is concatenated with an empty array yielding an empty array.

the next pair is [-2, 1] which gives (-1...1).to_a = [-1, 0]

the next pair is [1, 5] which gives (2...5).to_a = [2, 3, 4]

thus the final concatenation gives [-1, 0, 2, 3, 4]
=end