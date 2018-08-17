=begin
Use the solution in exercise four and add the following:

Move all of the methods from the MyCar class that also
pertain to the MyTruck class into the Vehicle class.
Make sure that all of your previous method calls are
working when you are finished.

Note => I had already moved the functionality in the Vehicle
class in the first exercise.  So I decided to add a module which
would be included in the MyTruck class.
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

  def brake(decrease)
    self.speed -= decrease
  end

  def shutdown
    self.speed = 0
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
    assert(@truck.load_too_big?(5000))
  end

end
