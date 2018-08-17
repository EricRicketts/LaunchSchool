=begin
Use the results of exercise five to do the following:

Write a method called age that calls a private method to calculate
the age of the vehicle. Make sure the private method is not available
from outside of the class. You'll need to use Ruby's built-in Time class to help.
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

module Towable

  def load_too_big?(weight)
    weight > 4000
  end

end

module HotRodable

  def accelerate(increase)
    self.speed += increase * 1.10
  end
end

class Vehicle

  attr_accessor :color, :model, :make, :year, :speed

  @@number_of_vehicles = 0

  def self.number_of_vehicles
    @@number_of_vehicles
  end

  def initialize(color, model, make, year)
    self.color = color
    self.model = model
    self.make = make
    self.year = year
    self.speed = 0
    @@number_of_vehicles += 1
  end

  def accelerate(increase)
    self.speed += increase
  end

  def age
    "The vehicle is #{age_in_years} years old."
  end

  def brake(decrease)
    self.speed -= decrease
  end

  def shutdown
    self.speed = 0
  end

  private

  def age_in_years
    Time.new.year - year.to_i
  end

end

class MyCar < Vehicle
  include HotRodable
  REBUILT_ENGINE = true
end

class MyTruck < Vehicle
  include Towable
  TOWED_TRAILER = true
end

class ExerciseFiveTest < Minitest::Test

  def setup
    @car = MyCar.new("Orange", "Charger", "Dodge", "1967")
    @truck = MyTruck.new("Black", "3100 Pick Up", "Chevrolet", "1951")
  end


  def test_1
    # skip
    current_year = Time.new.year
    expected = [current_year - 1967, current_year - 1951]
    car = @car.age.match(/[[:digit:]]+/)[0].to_i
    truck = @truck.age.match(/[[:digit:]]+/)[0].to_i
    assert_equal(expected, [car, truck])
  end

end
