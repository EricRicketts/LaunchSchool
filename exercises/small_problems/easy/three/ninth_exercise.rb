require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class NinthExercise < Minitest::Test

=begin
Palindromic Strings (Part 2)

Write another method that returns true if the string passed as an argument is a palindrome, false otherwise.
This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters.
If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

Examples:

real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false

=end 

  def real_palindrome?(str)
    # alpha_num_str = str_dwn.split(/[[[:punct:]][[:space:]]]+/).join
    # my first way to do it, does not catch non space or non punct chars
    # this solution follows the solution presented by LS, split on any
    # character that is not an alphanumeric character
    alpha_num_str = str.downcase.split(/[^[[:alnum:]]]+/).join
    alpha_num_str == alpha_num_str.reverse
  end

  def test_one
    assert(real_palindrome?('madam'))     
  end

  def test_two
    assert(real_palindrome?('Madam'))     
  end

  def test_three
    assert(real_palindrome?("Madam, I'm Adam"))     
  end

  def test_four
    assert(real_palindrome?('356653'))     
  end

  def test_five
    assert(real_palindrome?('356a653'))     
  end

  def test_six
    refute(real_palindrome?('123ab321'))     
  end

end

class NinthExerciseLS < Minitest::Test

  def real_palindrome?(str)
    # this is the LS solution, makes very good use
    # of the #delete operation in the String class
    # this instance method is worth reviewing.
    # another way to do this is str.downcase.gsub(/[^a-z0-9]/, '')
    alpha_num_str = str.downcase.delete('^a-z0-9')
    alpha_num_str == alpha_num_str.reverse
  end

  def test_one
    assert(real_palindrome?('madam'))     
  end

  def test_two
    assert(real_palindrome?('Madam'))     
  end

  def test_three
    assert(real_palindrome?("Madam, I'm Adam"))     
  end

  def test_four
    assert(real_palindrome?('356653'))     
  end

  def test_five
    assert(real_palindrome?('356a653'))     
  end

  def test_six
    refute(real_palindrome?('123ab321'))     
  end
  
end