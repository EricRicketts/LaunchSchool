=begin
Override the to_s method to create a user friendly print out of your object.
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class MyCar

  attr_accessor :color, :model, :year, :speed

  def self.gas_mileage(gallons, mileage)
    (mileage.to_f / gallons).round(2)
  end

  def initialize(c, m, y)
    self.color = c
    self.model = m
    self.year = y
    self.speed = 0
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

  def to_s
    "My car is a #{year} #{model} of color #{color}."
  end

end

class ExerciseTwoTest < Minitest::Test

  def setup
    @car = MyCar.new("Orange", "Charger R/T-SE", "1969")
  end

  def test_1
    # skip
    expected = "My car is a 1969 Charger R/T-SE of color Orange."
    assert_equal(expected, @car.to_s)
  end

end
