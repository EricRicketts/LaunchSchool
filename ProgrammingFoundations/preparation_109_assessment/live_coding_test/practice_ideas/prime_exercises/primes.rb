require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67,
71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149,
151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229,
233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313,
317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409,
419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499,
503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601,
607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691,
701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809,
811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887, 907,
911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997
=end

class PrimesGeneratePrimes < Minitest::Test

=begin
I: n - desired number of primes
O: array of primes
AL:
  - if the number is only divisible by itself and 1 then it is a prime
    then add it to the array
  - if a new number is divisible by any of the other primes then it is not a prime
  - break out of the loop when the size of the array = number is desired primes
=end

  def primes(number_of_primes)
    arr_of_primes, number = [2], 2
    until arr_of_primes.length == number_of_primes
      number += 1
      if (2...number).none? { |n| (number % n).zero? }
        arr_of_primes.push(number)
      end
    end
    arr_of_primes
  end

  def test_1
    # skip
    assert_equal([2], primes(1))
  end

  def test_2
    # skip
    assert_equal([2, 3, 5, 7, 11], primes(5))
  end

  def test_3
    # skip
    expected = [
      2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37,
      41, 43, 47, 53, 59, 61, 67, 71
    ]
    assert_equal(expected, primes(20))
  end

end

class PrimesBetweenN1AndN2 < Minitest::Test

=begin
I: n1 - start number, n2 - end number, n2 must be > n1
O: array of primes between n1 and n2 inclusive
AL:
  - if number divisible by 2 up to n2 non-inclusive
    and the number is >= n1 add it to the prime array
=end

  def primes_between(n1, n2)
    (2..n2).select do |number|
      (2...number).none? { |n| (number % n).zero? }
    end.select { |n| n >= n1 }
  end

  def test_1
    # skip
    assert_equal([2, 3], primes_between(2, 3))
  end

  def test_2
    # skip
    expected = [
      211, 223, 227, 229, 233, 239, 241, 251,
      257, 263, 269, 271, 277, 281, 283, 293
    ]
    assert_equal(expected, primes_between(200, 300))
  end

  def test_3
    # skip
    expected = [
      907, 911, 919, 929, 937, 941, 947,
      953, 967, 971, 977, 983, 991, 997
    ]
    assert_equal(expected, primes_between(900, 1000))
  end

end

class PrimesIsPrime < Minitest::Test

  def is_prime?(number)
    (2...number).none? { |n| (number % n).zero? }
  end

  def test_1
    # skip
    prime_list = [
      269, 271, 277, 281, 283,
      443, 449, 457, 461, 463,
      853, 857, 859, 863, 877
    ]
    assert(prime_list.all? { |number| is_prime?(number) })
  end

  def test_2
    # skip
    prime_list = [
      141, 273, 343, 447, 527, 651, 747, 803
    ]
    assert(prime_list.none? { |number| is_prime?(number) })
  end

end

class PrimesListIsNotPrimeButOdd < Minitest::Test

  def is_prime?(number)
    (2...number).none? { |n| (number % n).zero? }
  end

  def odd_and_not_prime(limit)
    arr_odd_not_prime = []
    number = 3
    until arr_odd_not_prime.length == limit
      if number.odd? && !is_prime?(number)
        arr_odd_not_prime.push(number)
      end
      number += 1
    end
    arr_odd_not_prime
  end

  def test_1
    # skip
    expected = [9, 15, 21, 25, 27, 33, 35, 39, 45, 49]
    assert_equal(expected, odd_and_not_prime(10))
  end

end

class PrimesOddAndNotPrimeBetween < Minitest::Test

  def is_prime?(number)
    (2...number).none? { |n| (number % n).zero? }
  end

  def odds_not_prime_between(n1, n2)
    (2..n2).select do |n|
      n.odd? && !is_prime?(n)
    end.select { |n| n >= n1 }
  end

  def test_1
    # skip
    expected = [
      45, 49, 51, 55, 57, 63, 65, 69
    ]
    assert_equal(expected, odds_not_prime_between(40, 70))
  end

end
