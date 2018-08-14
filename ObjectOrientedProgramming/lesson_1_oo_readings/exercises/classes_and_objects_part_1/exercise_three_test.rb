=begin
You want to create a nice interface that allows you to accurately describe the action
you want your program to perform. Create a method called spray_paint that can be called
on an object and will modify the color of the car.
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class MyCar
  attr_accessor :year, :model, :color, :speed

  def initialize(y, m, c)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end

  def accelerate(increase)
    self.speed += increase
  end

  def brake(decrease)
    self.speed -= decrease
  end

  def shutdown
    self.speed = 0
  end

  def spray_paint(new_color)
    old_color = self.color
    self.color = new_color
    "The old color was #{old_color} the car was spray painted and the new color is #{color}."
  end

end

class ExerciseThreeTest < Minitest::Test

  def setup
    @car = MyCar.new("1969", "Charger R/T-SE", "Orange")
  end

  def test_1
    # skip
    expected = "The old color was Orange the car was spray painted and the new color is Blue."
    assert_equal(expected, @car.spray_paint("Blue"))
  end

end
