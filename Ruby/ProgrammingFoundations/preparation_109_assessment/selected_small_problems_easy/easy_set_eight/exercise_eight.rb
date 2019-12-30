require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Double Char (Part 2)

Write a method that takes a string, and returns a new string in
which every consonant character is doubled. Vowels (a,e,i,o,u),
digits, punctuation, and whitespace should not be doubled.

Examples:

double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

AL:
  - make an empty string
  - go through each character
    - if it is not a vowel, digit, space, or punctuation
      double it and add it
    - else add it
=end

class ExerciseEight < Minitest::Test

  def double_consonants(str)
    result = ''
    str.chars.each do |char|
      unless char.match?(/[aeiouAEIOU[[:digit:]][[:punct:]][[:space:]]]/)
        result << char*2
      else
        result << char
      end
    end
    result
  end

  def test_0
    # skip
    expected = "SSttrrinngg"
    result = double_consonants('String')
    assert_equal(expected, result)
  end
  
  def test_1
    # skip
    expected = "HHellllo-WWorrlldd!"
    result = double_consonants('Hello-World!')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = "JJullyy 4tthh"
    result = double_consonants('July 4th')
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = ""
    result = double_consonants('')
    assert_equal(expected, result)
  end
  
end

class ExerciseEightAlternateSolution < Minitest::Test

  def double_consonants(str)
    regex = /([^aeiouAEIOU[[:digit:]][[:punct:]][[:space:]]])/
    str.gsub(regex, '\1\1')
  end

  def test_0
    # skip
    expected = "SSttrrinngg"
    result = double_consonants('String')
    assert_equal(expected, result)
  end
  
  def test_1
    # skip
    expected = "HHellllo-WWorrlldd!"
    result = double_consonants('Hello-World!')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = "JJullyy 4tthh"
    result = double_consonants('July 4th')
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = ""
    result = double_consonants('')
    assert_equal(expected, result)
  end
  
end
