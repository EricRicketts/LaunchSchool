require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Cat
  @@number_of_cats = 0

  def self.total
    @@number_of_cats
  end

  def initialize
    @@number_of_cats += 1
  end
end

class ExerciseFiveTest < Minitest::Test
  def test_one
    kitty1 = Cat.new
    kitty2 = Cat.new
    assert(2 == Cat.total)
  end
end