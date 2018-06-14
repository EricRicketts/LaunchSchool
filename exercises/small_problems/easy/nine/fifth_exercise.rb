=begin
Uppercase Check

Write a method that takes a string argument, and returns true if
all of the alphabetic characters inside the string are uppercase,
false otherwise. Characters that are not alphabetic should be ignored.

Examples:

uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true

AL:
  - check that the letter is part of the alphabet
  - if it is letter == letter.upcase
  - return false if one does not match
  - default return true
=end
require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FifthExercise < Minitest::Test

  def uppercase?(str)
    str.each_char do |char|
      return false if /[a-z]/i.match?(char) && char != char.upcase
    end
    true
  end

  def test_0
    # skip
    refute(uppercase?('t'))
  end

  def test_1
    # skip
    assert(uppercase?('T'))
  end
  
  def test_2
    # skip
    refute(uppercase?('Four Score'))
  end

  def test_3
    # skip
    assert(uppercase?('FOUR SCORE'))
  end
  
  def test_4
    # skip
    assert(uppercase?('4SCORE'))
  end

  def test_5
    # skip
    assert(uppercase?(''))
  end
  
end

class FifthExerciseAlternateSolution < Minitest::Test

  def uppercase?(str)
    str.each_char.select {|char| /[[:alpha:]]/.match?(char)}
      .all? {|char| /[[:upper:]]/.match?(char)}
  end

  def test_0
    # skip
    refute(uppercase?('t'))
  end

  def test_1
    # skip
    assert(uppercase?('T'))
  end
  
  def test_2
    # skip
    refute(uppercase?('Four Score'))
  end

  def test_3
    # skip
    assert(uppercase?('FOUR SCORE'))
  end
  
  def test_4
    # skip
    assert(uppercase?('4SCORE'))
  end

  def test_5
    # skip
    assert(uppercase?(''))
  end
  
end

class FifthExerciseLS < Minitest::Test
=begin
Again, I over thought the problem, I should have
tested something like '4SCORE', upcase only upcases
letters it leaves all other characters alone

uppercase?('') or uppercase?(' ') should both be
true because a non-letter is both upper can lower
case as its status is not really defined
=end

  def uppercase?(string)
    string == string.upcase
  end

  def test_0
    # skip
    refute(uppercase?('t'))
  end

  def test_1
    # skip
    assert(uppercase?('T'))
  end
  
  def test_2
    # skip
    refute(uppercase?('Four Score'))
  end

  def test_3
    # skip
    assert(uppercase?('FOUR SCORE'))
  end
  
  def test_4
    # skip
    assert(uppercase?('4SCORE'))
  end

  def test_5
    # skip
    assert(uppercase?(''))
  end
  
end

