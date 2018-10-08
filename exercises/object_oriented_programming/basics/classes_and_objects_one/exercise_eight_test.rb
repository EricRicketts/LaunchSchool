require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Cat
  attr_reader :name
  attr_writer :name

  def initialize(name)
    @name = name
  end

  def greet
    "Hello!  My name is #{name}!"
  end
end

class ExerciseEightTest < Minitest::Test
  def test_one
    kitty = Cat.new('Sophie')
    first_greet = kitty.greet
    kitty.name = 'Luna'
    second_greet = kitty.greet
    expected = [
      "Hello!  My name is Sophie!",
      "Hello!  My name is Luna!"
    ]
    assert_equal(expected, [first_greet, second_greet])
  end
end