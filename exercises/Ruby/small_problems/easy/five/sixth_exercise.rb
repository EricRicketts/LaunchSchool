require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Letter Counter (Part 1)

Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

Examples

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

I: string
O: hash

AL:
  - init hash to 0 for values
  - split in \s+
  - map each word:
    - count_hsh[word.length] += 1
=end

class SixthExercise < Minitest::Test

  def word_sizes(str)
    count_hsh = Hash.new(0)
    str.split(/\s+/).each {|word| count_hsh[word.length] +=1}
    count_hsh
  end

  def test_1
    assert_equal({ 3 => 1, 4 => 1, 5 => 1, 6 => 1 }, word_sizes('Four score and seven.'))
  end
  
  def test_2
    assert_equal({ 3 => 5, 6 => 1, 7 => 2 }, word_sizes('Hey diddle diddle, the cat and the fiddle!'))
  end
  
  def test_3
    assert_equal({ 6 => 1, 2 => 1, 4 => 1 }, word_sizes("What's up doc?"))
  end
  
  def test_4
    assert_equal({}, word_sizes(''))
  end
  
end