require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Write a program that reads the content of a text file and then prints the longest sentence in the file
based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?).
Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word.
You should also print the number of words in the longest sentence.

example files are provide in this current directory
=end

class FirstExercise < Minitest::Test

  def longest_sentence(file)
    text = File.read(file)
    text_wo_line_returns = text.gsub(/\n/, ' ')
    sentences = text_wo_line_returns.split(/\.|\?|\!/)
    sentences.map {|sentence| sentence.split.count}.max
  end

  def test_0
    assert_equal(86, longest_sentence("address.txt"))
  end
  
end