=begin
Use the results of exercise one and do the following:

Add a class variable to your superclass that can keep track
of the number of objects created that inherit from the superclass.
Create a method to print out the value of this class variable as well.
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

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
  REBUILT_ENGINE = true
end

class MyTruck < Vehicle
  TOWED_TRAILER = true
end

class ExerciseTwoTest < Minitest::Test

  def setup
    @car = MyCar.new("Orange", "Charger", "Dodge", "1967")
    @truck = MyTruck.new("Black", "3100 Pick Up", "Chevrolet", "1951")
  end


  def test_1
    # skip
    assert(2 == MyCar.number_of_vehicles && 2 == MyTruck.number_of_vehicles && 2 == Vehicle.number_of_vehicles)
  end

end
