require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
# Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and returns the same string
# with every 4th character in a word upcase. Other characters should remain the same.


# p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'LorEm IpsUm is simPly dumMy texT of the priNtinG'
# p to_weird_case('It is a long established fact that a reader will be distracted') == 'It is a lonG estAbliShed facT thaT a reaDer wilL be disTracTed'
# p to_weird_case('aaA bB c') == 'aaA bB c'
# p to_weird_case('Merry Poppins word is supercalifragilisticexpialidocious') == 'MerRy PopPins worD is supErcaLifrAgilIstiCexpIaliDociOus'

AL:
  - split on space
  - for each word every 4th char upcase
    - index 3 is 4th char, do index % 4
    - join array with ' '
=end

class Session12TestProblemOne < Minitest::Test

  def to_weird_case(str)
    words = str.split
    words.map do |word|
      word.chars.map.with_index do |char, idx|
        ((idx + 1) % 4).zero? ? char.upcase : char
      end.join
    end.join(' ')
  end

  def test_0
    expected = 'LorEm IpsUm is simPly dumMy texT of the priNtinG'
    result = to_weird_case('Lorem Ipsum is simply dummy text of the printing')
  end
  
  def test_1
    expected = 'It is a lonG estAbliShed facT thaT a reaDer wilL be disTracTed'
    result = to_weird_case('It is a long established fact that a reader will be distracted')
  end
  
  def test_2
    expected = 'aaA bB c'
    result = to_weird_case('aaA bB c')
  end
  
  def test_3
    expected = 'MerRy PopPins worD is supErcaLifrAgilIstiCexpIaliDociOus'
    result = to_weird_case('Merry Poppins word is supercalifragilisticexpialidocious')
  end
  
end

=begin
# Find the length of the longest substring in the given string that is the same in reverse.

# As an example, if the input was “I like racecars that go fast”, the substring (racecar) length would be 7.

# If the length of the input string is 0, return value must be 0.

# longest_palindrome("a") == 1
# longest_palindrome("aa") == 2
# longest_palindrome("baa") == 2
# longest_palindrome("aab") == 2
# longest_palindrome("baabcd") == 4
# longest_palindrome("baablkj12345432133d") == 9

AL:
  - develop a method for finding all the substrings of a given string
  - call the method to return an array of substrings
  - go through this array of substrings and select all substrings where
    the reverse string == current substring
  - call max on this selected list of susbtrings 
=end

class Session12TestProblemTwo < Minitest::Test

  def gen_all_substrs(str)
    last_index = str.size - 1
    index_range = (0..last_index)
    index_range.map do |idx|
      substr_index_range = (idx..last_index)
      substr_index_range.map do |i|
        str[idx..i]
      end
    end.flatten
  end

  def longest_palindrome(str)
    substrings = gen_all_substrs(str)
    palindromes = substrings.select {|substr| substr == substr.reverse}
    palindromes.max_by {|str| str.length}.size
  end

  def test_0
    # skip
    assert_equal(1, longest_palindrome('a'))
  end
  
  def test_1
    # skip
    assert_equal(2, longest_palindrome("aa"))    
  end
  
  def test_2
    # skip
    assert_equal(2, longest_palindrome("baa"))
  end
  
  def test_3
    # skip
    assert_equal(2, longest_palindrome("aab"))
  end

  def test_4
    # skip 
    assert_equal(4, longest_palindrome("baabcd"))
  end

  def test_5
    # skip
    assert_equal(9, longest_palindrome("baablkj12345432133d"))
  end
  
end