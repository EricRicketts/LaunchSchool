require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Animal
end

class Cat < Animal
end

class Bird < Animal
end

$ancestors = Cat.ancestors
$ancestors.delete(PP::ObjectMixin)
$ancestors.delete(Minitest::Expectations)

class ExerciseEightTest < Minitest::Test
  def test_one
    expected = [
      Cat, Animal, Object, Kernel, BasicObject
    ]
    assert_equal(expected, $ancestors)
  end

  def test_two
    cat = Cat.new
    assert_raises(NoMethodError) { cat.color }
  end
end