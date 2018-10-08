require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Cat
  def initialize
    puts "I am a cat!"
  end
end

class ExerciseFourTest < Minitest::Test
  def test_one
    assert_output(/I am a cat!/) { kitty = Cat.new }
  end
end