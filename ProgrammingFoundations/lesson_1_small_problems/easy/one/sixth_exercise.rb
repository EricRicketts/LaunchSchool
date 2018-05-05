require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class SixthExercise < Minitest::Test

=begin
Reverse It (Part 2)

Write a method that takes one argument, a string containing one or more words, and returns the given string with all five or more letter words reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

Examples:

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS


Input:
  - A string containing one or more words
  - Guaranteed only letters for words and spaces between words
  - Spaces only present when word content > 1

Output:
  - String is echoed, except
  - if a word consists of >= 5 characters then that word is reversed

DS:
  - An array of words

Algorithm
  - Use map if the word >= 5 chars, reverse it
=end

  def reverse_words(sentence)
    sentence.split(/\s+/).map {|word| word.length >= 5 ? word.reverse : word}.join(" ")
  end

  def reverse_words_v2(sentence)
    words = []

    sentence.split(/\s+/).each do |word|
      words << (word.length >= 5 ? word.reverse : word)
    end
    words.join(" ")
  end

  def test_one
    assert_equal('lanoisseforP', reverse_words('Professional'))    
  end
  
  def test_two
    assert_equal('Walk dnuora the kcolb', reverse_words('Walk around the block'))    
  end
  
  def test_three
    assert_equal('hcnuaL loohcS', reverse_words('Launch School'))    
  end
  
  def test_four
    assert_equal('lanoisseforP', reverse_words_v2('Professional'))    
  end
  
  def test_five
    assert_equal('Walk dnuora the kcolb', reverse_words_v2('Walk around the block'))    
  end
  
  def test_six
    assert_equal('hcnuaL loohcS', reverse_words_v2('Launch School'))    
  end
  
end