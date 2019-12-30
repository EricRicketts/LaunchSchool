require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Cat
end

class ExerciseTwoTest < Minitest::Test
  def test_one
    assert_kind_of(Object, Cat.new)
  end
end