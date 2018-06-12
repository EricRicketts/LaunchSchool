require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'
=begin
  1.  Write a program that takes a group of integers from 1 to a 1000 at the most and counts the number of odd numbers that are not prime
  2.  solve(['abode', 'ABc', 'xyzD']) => [4, 3, 1] Consider the word 'abode'.  We can see that 'a' is in position 1 and that 'b' is in
  position 2.  In the alphabet 'a' and 'b' are in positions 1 and 2.  Notice also that 'd' and 'e' in 'abode' occupy the same positions
  as they would in the alphabet, that is positions 4 and 5.  You program should count, for each string in the array of strings how
  many letters are in their proper alphabet position.

- Input: an integer
- output: an array

- Data structure:
  - take the integer input convert to an array up to but not including enpoint

- Algorithm
  - select number which is odd && not prime
  - need a method to tell whether a number is not prime
    - a number is prime if it divisible by only 1 and itself
    - 1 is not a prime number
    - take the array [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] 
      - have a guard condition for 1, if 1 only then return 1, otherwise skip 1
      - we will pass a number into the is_prime? or not_prime? method
        - (2..10).to_a => [2, 3, 4, 5, 6, 7, 8, 9, 10]
        - so if the number is divisible by any number right before it, then it is not prime
        - so let's say the number is 10 then we try to divide 10 by 2..9 if any number divides 10
        between 2 and 9 then 10 is not prime
        - we can use find because we want to exit immediately when we find a number
    - once we select the numbers we call length on the array to count them

  - refinement
    - Have a guard condition if the number is 1 then return 1
    - otherwise start at 2
    - for number num, subset = (2...num).to_a
    - !!subset.find {|n| (num % n).zero?} this returns true if the number is not prime
    - select num.odd? && is_not_prime?(num)

=end

class Session1TestPrimeExercise < Minitest::Test

  def count_odd_and_not_prime_to(int)
    return 1 if int == 1
    (1..int).select {|n| n.odd? && is_not_prime?(n)}.length + 1
  end

  def is_not_prime?(int)
    subset = (2...int).to_a
    !!subset.find {|n| (int % n).zero?}
  end

  def test_odd_and_not_prime_to_1
    assert_equal(1, count_odd_and_not_prime_to(1))
  end

  def test_odd_and_not_prime_to_10
    assert_equal(2, count_odd_and_not_prime_to(10))
  end

  def test_odd_and_not_prime_to_20
    assert_equal(3, count_odd_and_not_prime_to(20))
  end
  
  def test_odd_and_not_prime_to_100
    assert_equal(26, count_odd_and_not_prime_to(100))
  end
  
end

class Session1TestCountLettersPos < Minitest::Test

=begin
input: an array of strings
output: an array of integers

Data Structure:
  - downcase each string
  - first create an array of lower case letters from a..z, as each index will show the letters position
  - need to convert each string into an array of chars

Algorithm
  - traverse through each char in the array of chars, provide the index in addition to the char
  - then call map on the each array of chars
    - if index (of char in string) = index (of char in alphabet) select the char, this will return
      an array of chars which are in the correct alphabetic position
    - once the selection is done count the size of the array

=end

  def solve(ary_of_strs)
    alphabet = ('a'..'z').to_a
    ary_of_arys_of_chars = ary_of_strs.map {|str| str.downcase.chars}

    ary_of_arys_of_chars.map do |ary_of_chars|
      ary_of_chars.select.with_index do |char, index|
        index == alphabet.index(char)
      end.count
    end
  end

  def test_first_solve
    assert_equal([4, 3, 1], solve(%W(abode ABc xyzD)))
  end

  def test_second_solve
    assert_equal([2, 3], solve(%W(zbfd facjhfxyzj)))
  end
  
end

class Session1TestCountLettersPosSecond < Minitest::Test

  LETTER_POSTIONS = ('a'..'z').zip(0..25).to_h

  def solve(arr)
    arr.map do |word|
      word.chars.each.with_index.inject(0) do |sum, (char, idx)|
        sum += 1 if idx == LETTER_POSTIONS[char.downcase]
        sum
      end
    end
  end

  def test_first_solve
    assert_equal([4, 3, 1], solve(%W(abode ABc xyzD)))
  end

  def test_second_solve
    assert_equal([2, 3], solve(%W(zbfd facjhfxyzj)))
  end
  
end