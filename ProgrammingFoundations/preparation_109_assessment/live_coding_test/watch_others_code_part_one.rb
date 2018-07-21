require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class WatchOthersCodePartOneProblemOneMySolution < Minitest::Test

=begin
Write a number that will determined if an integer is a prime, do
not use the prime library/class
=end

  def is_prime(num)
    num >= 2  && (2...num).none? { |divisor| (num % divisor).zero? }
  end

  def test_1
    # skip
    assert(is_prime(2))
  end

  def test_2
    # skip
    refute(is_prime(4))
  end

  def test_3
    # skip
    assert(is_prime(11))
  end

  def test_4
    # skip
    refute(is_prime(1))
  end

  def test_5
    # skip
    assert(is_prime(31))
  end

  def test_6
    # skip
    refute(is_prime(33))
  end

  def test_7
    # skip
    refute(is_prime(-5))
  end

end

class WatchOthersCodePartOneMyOwnProblemNumberOne < Minitest::Test

=begin
write a method that determines all the primes up to and including
a given number

2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61,
67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137,
139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199
=end

  def primes_to(number)
    primes = []
    (1..number).each do |num|
      next if num == 1
      primes.push(num) if num == 2
      primes.push(num) if primes.none? { |prime| (num % prime).zero? }
    end
    primes
  end

  def test_1
    # skip
    assert_equal([], primes_to(1))
  end

  def test_2
    # skip
    assert_equal([2], primes_to(2))
  end

  def test_3
    # skip
    expected = [2, 3, 5, 7]
    assert_equal(expected, primes_to(10))
  end

  def test_4
    # skip
    expected = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
    assert_equal(expected, primes_to(30))
  end

end

class WatchOthersCodePartOneMyOwnProblemNumberTwo < Minitest::Test


# write a method that determines all the primes up to and including
# a given number

# 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61,
# 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137,
# 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199


  def primes_between(n1, n2)
    primes = []
    (1..n2).each do |num|
      case num
      when 1 then next
      when 2 then primes.push(num)
      else
        primes.push(num) if primes.none? { |prime| (num % prime).zero? }
      end
    end
    primes.select { |prime| prime >= n1 }
  end

  def test_1
    # skip
    expected = []
    assert_equal(expected, primes_between(1, 1))
  end

  def test_2
    # skip
    expected = [2]
    assert_equal(expected, primes_between(1, 2))
  end

  def test_3
    # skip
    expected = [2, 3, 5, 7]
    assert_equal(expected, primes_between(1, 10))
  end

  def test_4
    # skip
    expected = [11, 13, 17, 19, 23, 29]
    assert_equal(expected, primes_between(10, 30))
  end

end
