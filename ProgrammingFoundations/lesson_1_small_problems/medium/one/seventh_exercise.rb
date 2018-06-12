require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Word to Digit
Write a method that takes a sentence string as input, and returns the
same string with any sequence of the words 'zero', 'one', 'two', 'three',
'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

Example:
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

AL:
  - create a hash which maps words to digits
  - split the string then map words to digits using the hash
=end

class SeventhExercise < Minitest::Test

  WORD_TO_DIGIT = %W(zero one two three four five six seven eight nine).zip(0..9).to_h

  def word_to_digit(str)
    str.split(/\b/).map do |word|
      WORD_TO_DIGIT.keys.include?(word) ? WORD_TO_DIGIT[word] : word
    end.join
  end

  def test_0
    expected = 'Please call me at 5 5 5 1 2 3 4. Thanks.'
    result = word_to_digit('Please call me at five five five one two three four. Thanks.')
    assert_equal(expected, result)
  end
  
end

class SeventhExerciseRegularExpression < Minitest::Test

  WORD_TO_DIGIT_HSH = %W(zero one two three four five six seven eight nine).zip(0..9).to_h
  WORD_TO_DIGIT_REGEX = Regexp.new("(" + WORD_TO_DIGIT_HSH.keys.join("|") + ")")

  def word_to_digit(str)
    str.gsub(WORD_TO_DIGIT_REGEX) {WORD_TO_DIGIT_HSH[$1]}
  end

  def test_0
    expected = 'Please call me at 5 5 5 1 2 3 4. Thanks.'
    result = word_to_digit('Please call me at five five five one two three four. Thanks.')
    assert_equal(expected, result)
  end
  
end

class SeventhExerciseLS < Minitest::Test

   DIGIT_HASH = {
    'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
    'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
    }.freeze

  def word_to_digit(words)
    DIGIT_HASH.keys.each do |word|
      words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
    end
    words
  end

  def test_0
    expected = 'Please call me at 5 5 5 1 2 3 4. Thanks.'
    result = word_to_digit('Please call me at five five five one two three four. Thanks.')
    assert_equal(expected, result)
  end
  
end

class SeventhExerciseAlternateSolutionOne < Minitest::Test

   DIGIT_HASH = {
    'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
    'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
    }.freeze

  def word_to_digit(words)
    DIGIT_HASH.keys.each do |word|
      words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
    end
    words
  end

  def test_0
    expected = 'Please call me at 5 5 5 1 2 3 4. Thanks.'
    result = word_to_digit('Please call me at five Five FIVE one two three four. Thanks.')
    assert_equal(expected, result)
  end
  
end