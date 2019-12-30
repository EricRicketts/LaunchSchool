require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Cat
end

class ExerciseThreeTest < Minitest::Test
  def test_one
    kitty = Cat.new
    assert_instance_of(Cat, kitty)
  end
end