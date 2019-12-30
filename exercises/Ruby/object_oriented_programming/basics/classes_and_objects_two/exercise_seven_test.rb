require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "I am #{name}!"
  end
end

class ExerciseSevenTest < Minitest::Test
  def test_one
    kitty = Cat.new('Sophie')
    assert_equal("I am Sophie!", kitty.to_s)
  end
end