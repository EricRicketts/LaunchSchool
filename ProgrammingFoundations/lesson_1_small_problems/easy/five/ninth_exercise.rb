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


I: string
O: collapsed string

AL:
  - split into words
    - split each word into a character array
      - set previous char to ''
      - if the current char == previous char shift the array
      - at the end join the array
    
=end

class NinthExercise < Minitest::Test

  def crunch(str)
     str.gsub(/([[:alnum:]])(\1)+/, '\1')
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

class NinthExerciseVersionTwo < Minitest::Test

  def crunch(str)
    str_ary = str.split
    str_ary.map do |word|
      letter_ary = word.chars
      letter_ary.reject.with_index do |char, idx|
        next if idx.zero?
        char == letter_ary[idx - 1]
      end.join
    end.join(' ') 
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

class NinthExerciseLS < Minitest::Test

=begin
I like this solution for its simplicity, it traversed through the index
of the string and just pushed the correct character onto a new string
if it DID NOT MATCH the next character in the sequence
=end

  def crunch(str)
    crunched_str = ''
    idx = 0
    while idx < str.length
      crunched_str << str[idx] unless str[idx] == str[idx + 1]
      idx += 1
    end
    crunched_str
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