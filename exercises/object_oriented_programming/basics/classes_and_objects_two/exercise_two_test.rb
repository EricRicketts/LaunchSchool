require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(new_name)
    self.name = new_name
  end
end

class ExerciseTwoTest < Minitest::Test
  def test_one
    kitty = Cat.new('Sophie')
    first_name = kitty.name
    kitty.rename('Chloe')
    second_name = kitty.name
    assert_equal(%w(Sophie Chloe), [first_name, second_name])
  end
end