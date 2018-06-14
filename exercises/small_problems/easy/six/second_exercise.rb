require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Delete Vowels

Write a method that takes an array of strings, and returns an array of the same string values,
except with the vowels (a, e, i, o, u) removed.

Example:

remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
=end

class SecondExercise < Minitest::Test

  def remove_vowels(str_ary)
    str_ary.map {|str| str.gsub(/[aeiou]/i, '')}    
  end

  def test_1
    expected = %w(bcdfghjklmnpqrstvwxyz)
    result = remove_vowels(%w(abcdefghijklmnopqrstuvwxyz))
    assert_equal(expected, result)
  end

  def test_2
    expected = %w(grn YLLW blck wht)
    result = remove_vowels(%w(green YELLOW black white))
    assert_equal(expected, result)
  end

  def test_3
    expected = ['BC', '', 'XYZ']
    result = remove_vowels(%w(ABC AEIOU XYZ))
    assert_equal(expected, result)
  end
 
end

class SecondExerciseLS < Minitest::Test

=begin
I like this solution better because the String#delete
operation is more clear in the intent
=end

  def remove_vowels(strings)
    strings.map {|str| str.delete('aeiouAEIOU')}    
  end

  def test_1
    expected = %w(bcdfghjklmnpqrstvwxyz)
    result = remove_vowels(%w(abcdefghijklmnopqrstuvwxyz))
    assert_equal(expected, result)
  end

  def test_2
    expected = %w(grn YLLW blck wht)
    result = remove_vowels(%w(green YELLOW black white))
    assert_equal(expected, result)
  end

  def test_3
    expected = ['BC', '', 'XYZ']
    result = remove_vowels(%w(ABC AEIOU XYZ))
    assert_equal(expected, result)
  end  
  
end