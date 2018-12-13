require 'minitest/autorun'
require 'minitest/reporters'
require 'pry-byebug'
Minitest::Reporters.use!

class Exercise4Test < Minitest::Test

  def divisors(num)
    (1..num).select { |n| (num % n).zero? }
  end

  def test_one
    assert_equal([1], divisors(1))
  end

  def test_seven
    assert_equal([1, 7], divisors(7))
  end

  def test_twelve
    assert_equal([1, 2, 3, 4, 6, 12], divisors(12))
  end

  def test_ninety_eight
    assert_equal([1, 2, 7, 14, 49, 98], divisors(98))
  end

  def test_big_number
    assert_equal([1, 9967, 9973, 99400891], divisors(99400891))
  end
end

class Exercise4TestMakeFaster < Minitest::Test

  def divisors(num)
    return [1] if num == 1
    (1..num).each_with_object([]) do |divisor, result|
      quotient, remainder = num.divmod(divisor)
      break result if divisor > quotient
      remainder.zero? ? result.push(quotient, divisor) : result
    end.sort
  end

  def test_one
    assert_equal([1], divisors(1))
  end

  def test_twelve
    assert_equal([1, 2, 3, 4, 6, 12], divisors(12))
  end

  def test_big_number
    assert_equal([1, 9967, 9973, 99400891], divisors(99400891))
  end

  def test_very_big_number
    assert_equal([1, 999979, 999983, 999962000357], divisors(999962000357))
  end
end
