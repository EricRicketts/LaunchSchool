=begin
Consider a characters set consisting of letters, a space, and a point.  Words consist of one or more
but at most 20 characters.  An input text consists of one or more words separated from each other by
one or more spaces and terminated by 0 or mores spaces followed by a point.  Input should be read from,
and including, the first letter of the first word, up to and including the terminating point.  The output
text is to be produced such that sucessive words are separated by a single space with the last word being
terminated by a single point.  odd words are copied in reverse order while even words are merely echoed.

exmpale:
whats the matter with kansas. => whats eht matter htiw kansas.
=end

=begin

=end
require 'minitest/autorun'
require 'minitest/reporters'
require 'pry-byebug'
Minitest::Reporters.use!

class Exercise1Test < Minitest::Test
  attr_accessor :two_word_answer

  def setup
    @two_word_answer = "hello dlrow."
  end

  def reverse_odd_words(str)
    return "" if str.empty?
    str.scan(/[[:alpha:]]+/).map.with_index do |word, idx|
      idx.odd? ? word.reverse : word
    end.join(" ").concat(".")
  end

  def test_empty_space
    assert_equal("", reverse_odd_words(""))
  end

  def test_period_only
    assert_equal(".", reverse_odd_words("."))
  end

  def test_one_word
    assert_equal("hello.", reverse_odd_words("hello."))
  end

  def test_two_words
    assert_equal(two_word_answer, reverse_odd_words("hello world."))
  end

  def test_extra_space_before_period
    assert_equal(two_word_answer, reverse_odd_words("hello world ."))
  end

  def test_extra_space_between_words
    assert_equal(two_word_answer, reverse_odd_words("hello  world."))
  end

  def test_extra_space_between_words_and_period
    assert_equal(two_word_answer, reverse_odd_words("hello  world ."))
  end

  def test_three_words
    assert_equal("hello drow world.", reverse_odd_words("hello word world."))
  end

  def test_example_string
    expected = "whats eht matter htiw kansas."
    str = "whats the matter with kansas."
    assert_equal(expected, reverse_odd_words(str))
  end
end
