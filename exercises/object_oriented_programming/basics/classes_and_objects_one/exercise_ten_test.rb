require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

module Walkable
  def walk
    "Let us go for a walk!"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    "Hello!  My name is #{name}!"
  end
end

class ExerciseTenTest < Minitest::Test
  def test_one
    kitty = Cat.new('Sophie')
    greet = kitty.greet
    walk = kitty.walk
    expected = [
      "Hello!  My name is Sophie!",
      "Let us go for a walk!"
    ]
    assert_equal(expected, [greet, walk])
  end
end