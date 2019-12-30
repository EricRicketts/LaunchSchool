require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class EighthExercise < Minitest::Test

=begin
Palindromic Strings (Part 1)

Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

Examples:

palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true

=end

  def palindrome?(str)
    # better solution is str == str.reverse as 
    # string has #reverse
    str.chars == str.chars.reverse
  end

  def test_first_string
    assert(palindrome?('madam'))    
  end
 
  def test_second_string
    refute(palindrome?('Madam'))    
  end
 
  def test_third_string
    refute(palindrome?("madam i'm adam"))    
  end
 
  def test_fourth_string
    assert(palindrome?('356653'))    
  end
 
end