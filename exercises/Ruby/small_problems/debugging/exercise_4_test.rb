require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise4Test < Minitest::Test

  def reverse_sentence(sentence)
    words = sentence.split(' ')
    reversed_words = []

    i = 0
    while i < words.length
      reversed_words = words[i] + reversed_words
      i += 1
    end

    reversed_words.join(' ')
  end

  def reverse_sentence_fix(sentence)
    words = sentence.split(' ')
    reversed_words = []

    i = 0
    while i < words.length
      reversed_words = Array.new(1, words[i]) + reversed_words
      i += 1
    end

    reversed_words.join(' ')
  end

  def test_wrong_answer
    assert_raises(TypeError) { reverse_sentence('how are you doing') }
  end

  def test_fix
    assert_equal('doing you are how', reverse_sentence_fix('how are you doing'))
  end
end