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
  - if the string length is odd
    - then idx = string length/2
    - then just take str[idx]
  - if string length is even
    - then idx overshoots by one character
    - so go back a character and slice from
    the back index and call for 2 characters 
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class TenthExerciseManual < Minitest::Test

  # this was the same algorith LS used
  def center_of(str)
    str_lnth = str.size
    center_idx = str_lnth / 2
    str_lnth.odd? ? str[center_idx] : str[center_idx-1, 2]
  end

  def test_1
    # skip
    assert_equal('e', center_of('I love ruby'))
  end
  
  def test_2
    # skip
    assert_equal(' ', center_of('Launch School'))
  end
  
  def test_3
    # skip
    assert_equal('un', center_of('Launch'))
  end
  
  def test_4
    # skip
    assert_equal('hs', center_of('Launchschool'))
  end
  
  def test_5
    # skip
    assert_equal('x', center_of('x'))
  end
  
  def test_6
    # skip
    assert_equal('xs', center_of('xs'))
  end
  
end