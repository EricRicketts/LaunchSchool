require 'minitest/autorun'
require 'minitest/pride'

class Exercise4Test < Minitest::Test
  VOWELS = ['a', 'e', 'i', 'o', 'u', 'y'].freeze
  def test_output_vowels
    vowels = []
    hsh = {
      first: ['the', 'quick'],
      second: ['brown', 'fox'],
      third: ['jumped'],
      fourth: ['over', 'the', 'lazy', 'dog']
    }
    hsh.each_value do |value|
      value.each do |str|
        str.chars.each do |letter|
          vowels.push(letter) if VOWELS.include?(letter)
        end
      end
    end
    assert_equal ["e", "u", "i", "o", "o", "u", "e", "o", "e", "e", "a", "y", "o"], vowels
  end
end