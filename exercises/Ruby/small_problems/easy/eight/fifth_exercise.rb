=begin
Palindromic Substrings

Write a method that returns a list of all substrings of a string that are palindromic.
That is, each substring must consist of the same sequence of characters forwards as it does backwards.
The return value should be arranged in the same sequence as the substrings appear in the string.
Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention
to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are.
In addition, assume that single characters are not palindromes.

Examples:

palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

AL:
  - first write a method which returns all substrings of a given string
  which are >= 2 characters per substring
  example 'abcde' =>
  'ab', 'abc', 'abcd', 'abcde',
  'bc', 'bcd', 'bcde',
  'cd', 'cde',
  'de'
    - outer loop, need strings:
    'abcde'
    'bcde',
    'cde',
    'de'
    loop until string.length - 2
=end
require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FifthExercise < Minitest::Test

  def palindromes(string)
    substr_ary = []
    last_outer_index = string.length - 2
    0.upto(last_outer_index) do |start_outer_index|
      substring = string[start_outer_index..-1]
      last_inner_index = substring.length - 1

      0.upto(last_inner_index) do |start_inner_index|
        next if substring[0..start_inner_index].length == 1
        inner_substr = substring[0..start_inner_index]
        substr_ary.push(inner_substr) if inner_substr == inner_substr.reverse
      end

    end
    substr_ary
  end

  def test_1
    # skip
    expected = []
    result = palindromes('abcde')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = ['madam', 'ada']
    result = palindromes('madam')
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = [
      'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
      'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
      '-madam-', 'madam', 'ada', 'oo'
    ]
    result = palindromes('hello-madam-did-madam-goodbye')
    assert_equal(expected, result)
  end
  
  def test_4
    # skip
    expected = [
      'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
    ]
    result = palindromes('knitting cassettes')
    assert_equal(expected, result)
  end
  
end

class FifthExerciseAlternateSolution < Minitest::Test

=begin
  example 'abcde' =>
  'ab', 'abc', 'abcd', 'abcde',
  'bc', 'bcd', 'bcde',
  'cd', 'cde',
  'de'
    - outer loop, need strings:
    'abcde'
    'bcde',
    'cde',
    'de'
=end

  def palindromes(string)
    substrings = string.chars.each_index.inject([]) do |substr_ary, idx|
      substr_ary.push(string[idx..-1]) unless string[idx..-1].length < 2
      substr_ary
    end
    matches = []
    substrings.map do |substr|
      substr.chars.each_index do |i|
        next if substr[0..i].length < 2
        inner_substr = substr[0..i]
        matches.push(inner_substr) if inner_substr == inner_substr.reverse
      end
    end
    matches
  end

  def test_1
    # skip
    expected = []
    result = palindromes('abcde')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = ['madam', 'ada']
    result = palindromes('madam')
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = [
      'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
      'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
      '-madam-', 'madam', 'ada', 'oo'
    ]
    result = palindromes('hello-madam-did-madam-goodbye')
    assert_equal(expected, result)
  end
  
  def test_4
    # skip
    expected = [
      'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
    ]
    result = palindromes('knitting cassettes')
    assert_equal(expected, result)
  end
  
end

class FifthExerciseLS < Minitest::Test

=begin
I should have taken the advice and done this from
the begining much simpler a solution and much
more readable.  I tried to get too fancy with the 
formulating the substrings by ensuring they were >= 2
characters in length rather than doing a simple boolean
check

  example 'abcde' =>
  'ab', 'abc', 'abcd', 'abcde',
  'bc', 'bcd', 'bcde',
  'cd', 'cde',
  'de'
    - outer loop, need strings:
    'abcde'
    'bcde',
    'cde',
    'de'
=end

  def palindromes(string)
    substrings(string).select {|substr| palindrome?(substr)}
  end

  def palindrome?(str)
    str == str.reverse && str.length > 1
  end

  def substrings(str)
    last_index = str.length - 1
    ary = []
    0.upto(last_index) do |idx|
      substring = str[idx..-1]
      substr_last_idx = substring.length - 1
      0.upto(substr_last_idx) do |i|
        ary.push(substring[0..i])
      end 
    end
    ary
  end

  def test_1
    # skip
    expected = []
    result = palindromes('abcde')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = ['madam', 'ada']
    result = palindromes('madam')
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = [
      'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
      'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
      '-madam-', 'madam', 'ada', 'oo'
    ]
    result = palindromes('hello-madam-did-madam-goodbye')
    assert_equal(expected, result)
  end
  
  def test_4
    # skip
    expected = [
      'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
    ]
    result = palindromes('knitting cassettes')
    assert_equal(expected, result)
  end
  
end