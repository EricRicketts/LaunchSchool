=begin
The End Is Near But Not Here

Write a method that returns the next to last word in the String passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.

Examples:

penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

AL
  - split on the spaces
  - return index[-2]
=end
require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class TenthExercise < Minitest::Test

  def penultimate(str)
    str.split[-2]
  end

  def test_1
    # skip
    expected = 'last'
    result = penultimate('last word')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = 'is'
    result = penultimate('Launch School is great!')
    assert_equal(expected, result)
  end
  
end

class TenthExerciseAltSol < Minitest::Test

  def penultimate(str)
    str.match(/(\w+)(\s+\w+[[:punct:]]?\z)/)[1]
  end

  def test_1
    # skip
    expected = 'last'
    result = penultimate('last word')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = 'is'
    result = penultimate('Launch School is great!')
    assert_equal(expected, result)
  end
  
end

class TenthExerciseFurtherExploration < Minitest::Test
=begin
this method returns the middle word of a string
penultimate('') = ''
penultimate('word') = 'word'
penultimate('last word') = 'last'
penultimate('The last word.') = 'last'
penultimate('The very last word.') = 'very'
penultimate('The very final last word.') = 'final'
=end

  def penultimate(str)
    return '' if str.empty?
    str_ary = str.split
    idx = (str_ary.length / 2.0).ceil - 1
    str_ary[idx]
  end

  def test_1
    # skip
    expected = ''
    result = penultimate('')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = 'word'
    result = penultimate('word')
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = 'last'
    result = penultimate('last word')
    assert_equal(expected, result)
  end
  
  def test_4
    # skip
    expected = 'last'
    result = penultimate('The last word.')
    assert_equal(expected, result)
  end
  
  def test_5
    # skip
    expected = 'very'
    result = penultimate('The very last word.')
    assert_equal(expected, result)
  end
  
  def test_6
    # skip
    expected = 'final'
    result = penultimate('The very final last word.')
    assert_equal(expected, result)
  end
  
end