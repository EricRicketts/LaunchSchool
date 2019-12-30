require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Consider a character set consisting of letters, a space, and a point.  Words consist of one or more, but at
most 20 letters.  An input text consists of one or more words separated from each other by one or more spaces
and terminated by 0 or more spaces followed by a point.  Input should be read from, and including, the first
letter of the first word, up to and including the terminating point.  The output text is to be produced such
that successive words are separated by a single space with the last word being terminated by a single point.
Odd words are copied in reverse order while even words are merely echoed.
=end

=begin
Notes:

Input:
1.  Only allowed characters are letters, spaces, and a point (period).
2.  Words must consist of 1 or more letters but no more that 20 letters.
3.  The input text will be terminated by a period.
4.  The period follows the last word by 0 or more spaces.
5.  Input text begins with the first letter of the first word.
6.  There can be one or more spaces between words.

Outupt:
1.  Successive words are separated by one space
2.  Output is terminated by a period immediately after the last word.
3.  With an index starting at 0, odd words are reversed while even
words are echoed, thus the first word in the character string, will
be the 0th word and will be even.

Provided example:
"whats the matter with kansas." => "whats eht matter htiw kansas."

Questions:
1.  How to handle leading spaces if present?
2.  What about empty string input?

Examples / Test Cases:

reverse_odd_words("hello.")                => "hello."
reverse_odd_words("hello .")               => "hello."
reverse_odd_words("hello world.")          => "hello dlrow."
reverse_odd_words("hello  world .")        => "hello dlrow."
reverse_odd_words("hello  hello world.")   => "hello olleh world."
reverse_odd_words("")                      => ""

=end

class ReverseOddWordsTest < Minitest::Test

  def reverse_odd_words(str)
    return "" if str.empty?
    str.scan(/[[:alpha:]]+/).map.with_index {|word, index| index.odd? ? word.reverse : word}.join(" ") + "."
  end

  def test_reverse_odd_words
    input = %W(hello. hello\s. hello\sworld. hello\s\sworld\s. hello\s\shello\sworld.)
    expected = %W(hello. hello. hello\sdlrow. hello\sdlrow. hello\solleh\sworld.)

    results = input.map {|str| reverse_odd_words(str)}
    assert_equal(expected, results)
  end

  def test_empty_input
    assert_equal("", reverse_odd_words(""))
  end

end