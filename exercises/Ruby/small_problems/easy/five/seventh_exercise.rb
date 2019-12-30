require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class SevethExercise < Minitest::Test

=begin
Letter Counter (Part 2)

Modify the word_sizes method from the previous exercise to exclude non-letters
when determining word size. For instance, the length of "it's" is 3, not 4.

Examples

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}
=end

  def word_sizes(str)
    count_hash = Hash.new(0)
    new_str = str.gsub(/[^a-zA-Z\s]/, '')
    new_str.split.each {|word| count_hash[word.length] += 1}
    count_hash
  end

  def test_1
    assert_equal({ 3 => 1, 4 => 1, 5 => 2 }, word_sizes('Four score and seven.'))
  end
  
  def test_2
    assert_equal({ 3 => 5, 6 => 3 }, word_sizes('Hey diddle diddle, the cat and the fiddle!'))
  end
  
  def test_3
    assert_equal({ 5 => 1, 2 => 1, 3 => 1 }, word_sizes("What's up doc?"))
  end
  
  def test_4
    assert_equal({}, word_sizes(''))
  end

end

class SeventhExerciseLS < Minitest::Test

=begin
I like this because each word deletes the non-alphabetic character
and the rest of the characters are joined to still make a word
so It's does not becme It s but Its
=end

  def word_sizes(str)
    count_hash = Hash.new(0)
    str.split.each do |word|
      clean_word = word.delete('^a-zA-Z')
      count_hash[clean_word.length] += 1
    end
    count_hash
  end

  def test_1
    assert_equal({ 3 => 1, 4 => 1, 5 => 2 }, word_sizes('Four score and seven.'))
  end
  
  def test_2
    assert_equal({ 3 => 5, 6 => 3 }, word_sizes('Hey diddle diddle, the cat and the fiddle!'))
  end
  
  def test_3
    assert_equal({ 5 => 1, 2 => 1, 3 => 1 }, word_sizes("What's up doc?"))
  end
  
  def test_4
    assert_equal({}, word_sizes(''))
  end  
  
end