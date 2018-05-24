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
=end
require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FifthExercise < Minitest::Test

  def test_1
    skip
    expected = []
    result = palindromes('abcd')
    assert_equal(expected, result)
  end
  
  def test_2
    skip
    expected = ['madam', 'ada']
    result = palindromes('madam')
    assert_equal(expected, result)
  end
  
  def test_3
    skip
    expected = [
      'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
      'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
      '-madam-', 'madam', 'ada', 'oo'
    ]
    result = palindromes('hello-madam-did-madam-goodbye')
    assert_equal(expected, result)
  end
  
  def test_4
    skip
    expected = [
      'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
    ]
    result = palindromes('knitting cassettes')
    assert_equal(expected, result)
  end
  
end