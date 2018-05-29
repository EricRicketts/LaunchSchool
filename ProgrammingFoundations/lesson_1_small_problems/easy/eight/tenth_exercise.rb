=begin
Get The Middle Character

Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument.
If the argument has an odd length, you should return exactly one character. If the argument has an even length,
you should return exactly two characters.

Examples:

center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'

AL:
  - loop and start at the front and at the back of the string
    - if string idx + 1 && string last - 1 are two characters
    then exit with that string
    else if string idx + 1 and string last -1 are the same
    then exit with that char 
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class TenthExerciseManual < Minitest::Test

  def center_of(str)
    pos_idx = 0
    neg_idx = -1
    
  end

  def test_1
    # skip
    assert_equal('e', center_of('I love ruby'))
  end
  
  def test_2
    skip
    assert_equal(' ', center_of('Launch School'))
  end
  
  def test_3
    skip
    assert_equal('un', center_of('Launch'))
  end
  
  def test_4
    skip
    assert_equal('hs', center_of('Launchschool'))
  end
  
  def test_5
    skip
    assert_equal('x', center_of('x'))
  end
  
  def test_6
    skip
    assert_equal('xs', center_of('xs'))
  end
  
end