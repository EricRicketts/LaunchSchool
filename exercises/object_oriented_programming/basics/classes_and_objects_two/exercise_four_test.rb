require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Cat
  attr_reader :name

  def self.generic_greeting
    "Hello!  I am a cat!"
  end

  def initialize(name)
    @name = name
  end

  def personal_greeting
    "Hello!  My name is #{name}!"
  end
end

class ExerciseFourTest < Minitest::Test
  def test_one
    kitty = Cat.new('Sophie')
    first_greet = Cat.generic_greeting
    second_greet = kitty.personal_greeting
    expected = [
      "Hello!  I am a cat!",
      "Hello!  My name is Sophie!"
    ]
    assert_equal(expected, [first_greet, second_greet])
  end
end