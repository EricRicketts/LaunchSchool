require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
ddaaiillyy ddoouubbllee

Write a method that takes a string argument and returns a new string that
contains the value of the original string with all consecutive duplicate
characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

Examples:

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

AL:
  have an empty string
  - go through the current string character by character
  - if the next char is not the same as the current char then add to the string
=end

class NinthExercise < Minitest::Test

  def crunch(str)
    new_str = ''
    char_ary = str.chars
    char_ary.each.with_index do |char, idx|
      new_str << char if char != char_ary[idx + 1]
    end
    new_str
  end

  def test_0
    # skip
    assert_equal('daily double', crunch('ddaaiillyy ddoouubbllee'))
  end
  
  def test_1
    # skip
    assert_equal('4abcabcba', crunch('4444abcabccba'))
  end
  
  def test_2
    # skip
    assert_equal('g', crunch('ggggggggggggggg'))
  end
  
  def test_3
    # skip
    assert_equal('a', crunch('a'))
  end

  def test_4
    # skip
    assert_equal('', crunch(''))
  end
  
end