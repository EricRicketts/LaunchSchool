require 'minitest/autorun'
require 'minitest/reporters'
require 'pry-byebug'
require_relative './text'
Minitest::Reporters.use!

class Exercise10Test < Minitest::Test
  attr_accessor :text_obj

  def setup
    file = File.read('./sample_text.txt')
    @text_obj = Text.new(file)
  end

  def test_word_count
    assert_equal(72, text_obj.word_count)
  end
end