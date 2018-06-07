require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Get The Middle Character

Write a method that takes a non-empty string argument, and returns the middle
character or characters of the argument. If the argument has an odd length,
you should return exactly one character. If the argument has an even length,
you should return exactly two characters.

Examples:

center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'

AL:
  - take the length of the string
  - if length odd then length/2 character index
  - if length even length/2 - 1, length/2
=end

class ExerciseTen < Minitest::Test

  def center_of(str)
    middle_idx = str.length/2
    middle_char = str.chars.find.with_index {|char, idx| idx == middle_idx}
    middle_char.prepend(str[middle_idx-1]) if str.length.even?
    middle_char
  end

  def test_0
    # skip
    expected = 'e'
    result = center_of('I love ruby')
  end
  
  def test_1
    # skip
    expected = ' '
    result = center_of('Launch School')
  end
  
  def test_2
    # skip
    expected = 'un'
    result = center_of('Launch')
  end
  
  def test_3
    # skip
    expected = 'hs'
    result = center_of('Launchschool')
  end

  def test_4
    # skip
    expected = 'x'
    result = center_of('x')
  end
    
end