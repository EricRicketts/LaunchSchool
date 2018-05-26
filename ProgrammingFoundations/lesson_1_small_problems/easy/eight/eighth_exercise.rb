=begin
Double Char (Part 2)

Write a method that takes a string, and returns a new string in which
every consonant character is doubled. Vowels (a,e,i,o,u), digits,
punctuation, and whitespace should not be doubled.

Examples:

double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""
=end
require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class EighthExercise < Minitest::Test

  def test_1
    skip
    expected = "SSttrrinngg"
    result = double_consonants('String')
  end
  
  def test_2
    skip
    expected = "HHellllo-WWorrlldd!"
    result = double_consonants("Hello-World!")
  end
  
  def test_3
    skip
    expected = "JJullyy 4tthh"
    result = double_consonants("July 4th")
  end
  
  def test_4
    skip
    expected = ""
    result = double_consonants('')
  end
  
end