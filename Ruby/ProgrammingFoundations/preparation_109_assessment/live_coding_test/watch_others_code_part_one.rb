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

class WatchOthersCodePartOneProblemTwoMySolution < Minitest::Test

=begin
write a method that will take an array of numbers and return only
prime numbers

AL:
  - for each number
    - reject if even and !=2
    - select if num = 2
    - select if none (2...number) number % num == 0
=end

  def select_primes(arr)
    arr.select do |number|
      number != 1 && (number == 2 || (2...number).none? { |n| (number % n).zero? })
    end
  end

  def test_1
    # skip
    assert_equal([], select_primes([4, 6, 8, 10]))
  end

  def test_2
    # skip
    expected = [2, 3]
    assert_equal(expected, select_primes([1, 2, 3, 4]))
  end

end

class WatchOthersCodePartOneProblemTwoExtra < Minitest::Test

=begin
write a method that will take an array of numbers and count the number
of primes in the array

AL:
  - for each number
    - reject if num == 1
    - select if num = 2
    - select if none (2...number) number % num == 0
=end

  def count_primes(arr)
    arr.select do |number|
      number != 1 && (number == 2 || (2...number).none? { |n| (number % n).zero? })
    end.count
  end

  def test_1
    # skip
    assert_equal(0, count_primes([4, 6, 8, 10]))
  end

  def test_2
    # skip
    expected = 2
    assert_equal(expected, count_primes([1, 2, 3, 4]))
  end

end

class WatchOthersCodePartOneAnotherProblem < Minitest::Test

=begin
write a method that will print out all odd numbers that are
not prime up to a certain number

AL:
  - range (2..number)
  - seleect if for each number
    - number != 2 and none (2...number).zero
=end

  def odds_not_prime(number)
    (2..number).select { |num| num.odd? && !prime?(num) }
  end

  def prime?(num)
    (2...num).none? { |divisor| (num % divisor).zero? }
  end

  def test_1
    # skip
    assert_equal([9, 15], odds_not_prime(15))
  end

  def test_2
    # skip
    assert_equal([9, 15, 21, 25, 27, 33, 35, 39], odds_not_prime(40))
  end

  def test_3
    # skip
    assert_equal([], odds_not_prime(3))
  end

end

class WatchOthersCodePartOneSecondProblem < Minitest::Test

=begin
User enters a number greater than 0, then with "s" (1..number) compute
sum of all numbers then with "p" compute product of all numbers
=end

  def sum_or_product(number, choice)
    case choice
    when "s" then (1..number).to_a.sum
    when "p" then (1..number).inject(1, :*)
    end
  end

  def test_1
    # skip
    assert_equal(55, sum_or_product(10, "s"))
  end

  def test_2
    # skip
    assert_equal(3628800, sum_or_product(10, "p"))
  end

end

class WatchOthersCodePartOneFourthProblem < Minitest::Test

=begin
write a method that takes two arrays as arguments and then
returns a new array with all elements in both arrays interleaved
=end

  def interleave(arr1, arr2)
    interleave_arr = []
    last_index = arr1.size - 1
    0.upto(last_index) do |idx|
      interleave_arr.push(arr1[idx], arr2[idx])
    end
    interleave_arr
  end

  def test_1
    # skip
    expected = [1, 'a', 2, 'b', 3, 'c']
    assert_equal(expected, interleave([1, 2, 3], ['a', 'b', 'c']))
  end

end

class WatchOthersCodePartOneFourthProblemAlternate < Minitest::Test

=begin
write a method that takes two arrays as arguments and then
returns a new array with all elements in both arrays interleaved
=end

  def interleave(arr1, arr2)
    arr1.zip(arr2).flatten
  end

  def test_1
    # skip
    expected = [1, 'a', 2, 'b', 3, 'c']
    assert_equal(expected, interleave([1, 2, 3], ['a', 'b', 'c']))
  end

end
