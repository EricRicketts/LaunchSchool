=begin
Double Char (Part 1)

Write a method that takes a string,
and returns a new string in which every character is doubled.

Examples:

repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''

AL:
  - split the string by String#chars
  - reduce the string each char*2
=end
require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class SeventhExercise < Minitest::Test

  def repeater(string)
    string.chars.inject('') {|sum_str, char| sum_str += char*2}
  end

  def test_1
    # skip
    expected = "HHeelllloo"
    result = repeater('Hello')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = "GGoooodd  jjoobb!!"
    result = repeater("Good job!")
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = ''
    result = repeater('')
    assert_equal(expected, result)
  end
  
end

class SeventhExerciseAlternateSolution < Minitest::Test

  # submitted by a studnent, I like this soluiton

  def repeater(string)
    string.gsub(/(.)/, '\1\1')    
  end

  def test_1
    # skip
    expected = "HHeelllloo"
    result = repeater('Hello')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = "GGoooodd  jjoobb!!"
    result = repeater("Good job!")
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = ''
    result = repeater('')
    assert_equal(expected, result)
  end
  
end