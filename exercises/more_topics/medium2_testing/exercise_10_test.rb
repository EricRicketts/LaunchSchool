require 'minitest/autorun'
require 'minitest/reporters'
require 'pry-byebug'
require_relative './text'
Minitest::Reporters.use!

class Exercise10Test < Minitest::Test
  attr_accessor :text_obj

  def setup
    file = File.open('./sample_text.txt')
    @text_obj = Text.new(file)
  end

  def test_import
    assert_equal(Text, text_obj.class)
  end

  def test_text_attribute
    assert_equal(File, text_obj.instance_variable_get('@text').class)
  end
end