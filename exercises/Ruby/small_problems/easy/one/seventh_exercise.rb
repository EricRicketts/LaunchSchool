require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class SeventhExercise < Minitest::Test

=begin
Stringy Strings

Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

Examples:

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
The tests above should print true.

Input: guaranteed to be a positive integer
Output: A string of alternating 1's and 0's ALWAYS beginning with 1

DS: Numbers

Algorithm:
  - The length of the string is always the same as the number
  - (number).downto(1)
  - if n = number digit = 1
    else last_digit == '1' ? "0" : "1" 

  - Observation
    - '1's will always be on the even indices
  - another way
    - Initialize an array with n '1's
    - Convert odd indices to '0'
=end

  def stringy(int)
    Array.new(int, '1').map.with_index {|digit, index| digit = index.odd? ? '0' : '1'}.join
  end

  def test_one
    assert_equal('101010', stringy(6))
  end
  
  def test_two
    assert_equal('101010101', stringy(9))
  end
  
  def test_three
    assert_equal('1010', stringy(4))
  end
  
  def test_four
    assert_equal('1010101', stringy(7))
  end

  def test_five
    assert_equal('1', stringy(1))
  end
  
  def test_six
    assert_equal('10', stringy(2))
  end
  
end

class SeventhExerciseKramer < Minitest::Test

=begin
I like this solution because you only iterate though
the numbers once.  And it makes use of the fact that
any number % 2 will either be 0 or 1
=end

  def stringy(int)
    str = ''
    1.upto(int) {|n| str << (n % 2).to_s} 
    str   
  end

  def test_one
    assert_equal('101010', stringy(6))
  end
  
  def test_two
    assert_equal('101010101', stringy(9))
  end
  
  def test_three
    assert_equal('1010', stringy(4))
  end
  
  def test_four
    assert_equal('1010101', stringy(7))
  end

  def test_five
    assert_equal('1', stringy(1))
  end
  
  def test_six
    assert_equal('10', stringy(2))
  end

end