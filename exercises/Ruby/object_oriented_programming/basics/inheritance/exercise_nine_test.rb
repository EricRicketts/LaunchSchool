require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

module Flyable
  def fly
    "I am flying!"
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal; end

class Bird < Animal
  include Flyable
end

$ancestors = Bird.ancestors
$ancestors.delete(PP::ObjectMixin)
$ancestors.delete(Minitest::Expectations)

class ExerciseNineTest < Minitest::Test
  def test_one
    bird = Bird.new('Red')
    assert_equal(Animal, bird.method(:color).owner)
  end

  def test_two
    expected = [
      Bird, Flyable, Animal, Object, Kernel, BasicObject
    ]
    assert_equal(expected, $ancestors)
  end
end
