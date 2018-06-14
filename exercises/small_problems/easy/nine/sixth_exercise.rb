require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
=begin
How long are you?

Write a method that takes a string as an argument,
and returns an Array that contains every word from
the string, to which you have appended a space and
the word length.

You may assume that words in the string are separated
by exactly one space, and that any substring of non-space
characters is a word.

Examples

word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []

AL:
  - split the arra on spaces
  - for each word do a map
    - [word + " " + word.size.to_s]

=end

class SixthExercise < Minitest::Test

  # I had the exact same answer as the LS solution

  def word_lengths(str)
    str.split.map {|word| "#{word} #{word.size}"}
  end

  def test_0
    # skip
    expected = ["cow 3", "sheep 5", "chicken 7"]
    result = word_lengths("cow sheep chicken")
    assert_equal(expected, result)
  end
  
  def test_1
    # skip
    expected = ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
    result = word_lengths("baseball hot dogs and apple pie")
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
    result = word_lengths("It ain't easy, is it?")
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = ["Supercalifragilisticexpialidocious 34"]
    result = word_lengths("Supercalifragilisticexpialidocious")
    assert_equal(expected, result)
  end
  
  def test_4
    # skip
    expected = []
    result = word_lengths("")
    assert_equal(expected, result)
  end
  
end