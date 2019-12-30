require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Cat
  COLOR = "purple"
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    "Hello!  My name is #{name} and I am a #{COLOR} cat!"
  end
end

class ExerciseSixTest < Minitest::Test
  def test_one
    kitty = Cat.new('Sophie')
    expected = "Hello!  My name is Sophie and I am a purple cat!"
    assert_equal(expected, kitty.greet)
  end
end