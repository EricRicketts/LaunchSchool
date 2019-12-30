require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class LiveSessionPart5FirstProblem < Minitest::Test

=begin
Write a method that takes a list of strings and returns
an array of the same string values, except with the vowels
removed:

example
green, yellow, black, white

returns: grn, yllw, blck, wht

AL:
  - we need to perform a map operation
    - iterate on the array provide each word
      - subsitute and empty string for each vowel
=end

  def remove_vowels(words)
    words.map { |word| word.gsub(/[aeiou]/, '') }
  end

  def test_1
    # skip
    words = %W(green yellow black white)
    expected = %W(grn yllw blck wht)
    assert_equal(expected, remove_vowels(words))
  end

end

class LiveSessionPart5SecondProblem < Minitest::Test

=begin
Write a method that takes a string and returns a boolean
indicating whether the parantheses are balanced.

AL:
  - start with a variable balanced set to zero
  - break up the string into characters
  - loop through each character
    - if char "(" add 1 to balanced
    - if char ")" subtract 1 from balanced
    - break with value false if at any time balanced < 0
  - when loop is done balanced should be zero check on
  this condition

=end

  def balancer(str)
    balanced = 0
    str.chars.each do |char|
      if char == "("
        balanced += 1
      elsif char == ")"
        balanced -= 1
      end
      return false if balanced < 0
    end
    balanced.zero?
  end

  def test_1
    # skip
    assert(balancer("hi"))
  end

  def test_2
    # skip
    refute(balancer("(hi"))
  end

  def test_3
    # skip
    assert(balancer("(hi)"))
  end

  def test_4
    # skip
    refute(balancer(")hi("))
  end

  def test_5
    # skip
    assert(balancer("(hi(no(yes)oops(inside))yuck)"))
  end

  def test_6
    # skip
    refute(balancer("(()) )("))
  end

  def test_7
    # skip
    refute(balancer("())"))
  end

end

class LiveSessionPart5ThirdProblem < Minitest::Test

=begin
write a method that takes two numbers, it should return
an array of all primes between those numbers inclusive

find_primes(3, 10) => [3, 5, 7]
find_primes(5, 20) => [5, 7, 11, 13, 17, 19]

AL:
  - big picture
    - it is too hard to start with the lower
    bound and compute the primes too many edge cases
    - instead calculate all primes from (1..upper bound)
    - all primes
      if n = 1 next
      if n = 2 push onto array
      else if the number is not divisible by any numbers
      in the current prime array add it to the current prime array
    - once all primes are found, then do a selection
      select the number if prime is >= lower and <= upper
=end

  def find_primes(lower, upper)
    all_primes = []
    (1..upper).select do |num|
      next if num == 1
      if num == 2
        all_primes.push(num)
        next
      else
        all_primes.push(num) if all_primes.none? { |prime| (num % prime).zero? }
      end
    end
    all_primes.select { |prime| prime >= lower }
  end

  def test_1
    # skip
    assert_equal([3, 5, 7], find_primes(3, 10))
  end

  def test_2
    # skip
    assert_equal([5, 7, 11, 13, 17, 19], find_primes(5, 20))
  end

  def test_3
    # skip
    assert_equal([31, 37, 41, 43, 47], find_primes(30, 50))
  end

  def test_4
    # skip
    assert_equal([], find_primes(1, 1))
  end

  def test_5
    # skip
    assert_equal([2], find_primes(1, 2))
  end

end
