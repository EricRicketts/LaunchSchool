require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

$ancestors = Cat.ancestors
$ancestors.delete(PP::ObjectMixin)
$ancestors.delete(Minitest::Expectations)

class ExerciseSevenTest < Minitest::Test
  def test_one
    cat = Cat.new('Black')
    assert_equal(Animal, cat.method(:color).owner)
  end

  def test_two
    expected = [
      Cat, Animal, Object, Kernel, BasicObject
    ]
    assert_equal(expected, $ancestors)
  end
end