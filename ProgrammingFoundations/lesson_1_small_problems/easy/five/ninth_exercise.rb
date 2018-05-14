require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
ddaaiillyy ddoouubbllee

Write a method that takes a string argument and returns a new string that contains the value of the original string
with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

Examples:

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
=end

class NinthExercise < Minitest::Test

  def crunch(str)
  end

  def test_1
    assert_equal('daily double', crunch('ddaaiillyy ddoouubbllee'))    
  end
  
  def test_2
    assert_equal('4abcabcba', crunch('4444abcabccba'))    
  end
  
  def test_3
    assert_equal('g', crunch('ggggggggggggggg'))    
  end
  
  def test_4
    assert_equal('a', crunch('a'))    
  end
  
  def test_5
    assert_equal('', crunch(''))    
  end
  
end