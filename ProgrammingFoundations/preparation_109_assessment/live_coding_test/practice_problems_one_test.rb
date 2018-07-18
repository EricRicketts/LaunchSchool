require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class PracticeProblemsOneTestProblemOneManual < Minitest::Test

=begin
Write a method that takes a string argument and returns a new string
that contains the value of the original string with all consecutive
duplicate characters collapsed into a single character.

AL:
  - split the string into words
  - perform a mapping operation on the array of words
  - convert each word into an array of characters
    - cycle through each array of characers
      - have a previous char set to an empty string
      - if the current char is different from the previous char
      add it to the char array then set the previous char to the current char

=end

  def collapse(str)
    words = str.split
    words.map do |word|
      previous_char = ''
      condensed_word = []
      word.chars.each do |current_char|
        if previous_char != current_char
          condensed_word.push(current_char)
          previous_char = current_char
        end
      end
      condensed_word.join
    end.join(' ')
  end

  def test_1
    # skip
    str = "bbbbbbbbb"
    expected = "b"
    result = collapse(str)
    assert_equal(expected, result)
  end

  def test_2
    # skip
    str = "wwooonndeerrfull woorrlldd"
    expected = "wonderful world"
    result = collapse(str)
    assert_equal(expected, result)
  end

end

class PracticeProblemsOneTestProblemOneManualModified < Minitest::Test

=begin
Write a method that takes a string argument and returns a new string
that contains the value of the original string with all consecutive
duplicate characters collapsed into a single character.

AL:
  - split the string into words
  - perform a mapping operation on the array of words
  - convert each word into an array of characters
    - cycle through each array of characers
      - have a previous char set to an empty string
      - if the current char is different from the previous char
      add it to the char array then set the previous char to the current char

=end

  def collapse(str)
    words = str.split
    words.map do |word|
      word.chars.select.with_index do |char, idx|
        idx == 0 || char != word[idx - 1]
      end.join
    end.join(' ')
  end

  def test_1
    # skip
    str = "bbbbbbbbb"
    expected = "b"
    result = collapse(str)
    assert_equal(expected, result)
  end

  def test_2
    # skip
    str = "wwooonndeerrfull woorrlldd"
    expected = "wonderful world"
    result = collapse(str)
    assert_equal(expected, result)
  end

end

class PracticeProblemsOneTestProblemRegex < Minitest::Test

=begin
Write a method that takes a string argument and returns a new string
that contains the value of the original string with all consecutive
duplicate characters collapsed into a single character.

AL:
  - split the string into words
  - perform a mapping operation on the array of words
  - convert each word into an array of characters
    - cycle through each array of characers
      - have a previous char set to an empty string
      - if the current char is different from the previous char
      add it to the char array then set the previous char to the current char

=end

  def collapse(str)
    str.split.map { |word| word.gsub(/([[:alnum:]])\1+/, '\1')}.join(' ')
  end

  def test_1
    # skip
    str = "bbbbbbbbb"
    expected = "b"
    result = collapse(str)
    assert_equal(expected, result)
  end

  def test_2
    # skip
    str = "wwooonndeerrfull woorrlldd"
    expected = "wonderful world"
    result = collapse(str)
    assert_equal(expected, result)
  end

end
