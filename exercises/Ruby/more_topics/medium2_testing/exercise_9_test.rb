require 'minitest/autorun'
require 'minitest/reporters'
require 'pry-byebug'
require_relative './text'
Minitest::Reporters.use!

class Exercise9Test < Minitest::Test
  attr_accessor :text_obj, :expected_output

  def setup
    file = File.read('./sample_text.txt')
    @text_obj = Text.new(file)
    @expected_output = File.read('./swap_text.txt')
  end

  def teardown
    File.delete('./result.txt')
  end

  def test_swap
    File.open('./result.txt', 'w+') do |f|
      f.write(text_obj.swap('a', 'e'))
    end
    assert_equal(expected_output, File.read('./result.txt'))
  end
end