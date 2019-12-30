=begin
Add a class method to your MyCar class that calculates the gas mileage of any car.

Note: I was confused initially as gas mileage should be associated with each car, unless
the car class is geared towards a make and model type.  Even then mileage will vary depending
on driving conditions.

I looked at the answer, so the code below is a reflection of that.
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

end

class ExerciseOneTest < Minitest::Test

  def setup
    @car = MyCar.new("Orange", "Charger R/T-SE", "1969")
  end

  def test_1
    # skip
    assert_equal(30.00, MyCar.gas_mileage(10, 300))
  end

end
