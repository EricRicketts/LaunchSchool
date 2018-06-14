require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Reverse It (Part 1)

Write a method that takes one argument, a string, and returns the same string with the words in reverse order.

Examples:

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
The tests above should print true.

Input: A string with words separated by one space
Output: A new string with the order of the original words reverse

Questions:
  - Punctuation? - assume no punctuation
  - more than one space - assume one space on input and output

Data Structure
  - Convert string into an array of words

Algorithm
  - Take array and reverse
=end

class FifthExercise < Minitest::Test

  def reverse_sentence(sentence)
    sentence.split(/\s+/).reverse.join(" ")
  end

  def test_first
    assert_equal('', reverse_sentence(''))
  end
  
  def test_second
    assert_equal('World Hello', reverse_sentence('Hello World'))
  end
  
  def test_third
    assert_equal('words these Reverse', reverse_sentence('Reverse these words'))
  end
  
end