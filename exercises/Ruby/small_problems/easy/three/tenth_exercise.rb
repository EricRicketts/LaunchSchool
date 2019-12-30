require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class TenthExercise < Minitest::Test

=begin
Palindromic Number

Write a method that returns true if its integer argument is palindromic, false otherwise.
A palindromic number reads the same forwards and backwards.

Examples:

palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true
=end

  def palindromic_number?(int)
    int.digits == int.digits.reverse
  end

  def test_one
    assert(palindromic_number?(34543))
  end
  
  def test_two
    refute(palindromic_number?(123210))
  end
  
  def test_three
    assert(palindromic_number?(22))
  end
  
  def test_four
    assert(palindromic_number?(5))
  end
  
end