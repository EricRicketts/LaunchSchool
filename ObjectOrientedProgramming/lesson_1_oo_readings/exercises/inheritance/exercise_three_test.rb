=begin
From the results of exercise two add the following:

Create a module that you can mix in to ONE of your
subclasses that describes a behavior unique to that subclass.
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

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
  TOWED_TRAILER = true
end

class ExerciseThreeTest < Minitest::Test

  def setup
    @car = MyCar.new("Orange", "Charger", "Dodge", "1967")
    @truck = MyTruck.new("Black", "3100 Pick Up", "Chevrolet", "1951")
  end

  def test_1
    # skip
    @truck.accelerate(10)
    @car.accelerate(10)
    expected = [10, 11.0]
    results = [@truck.speed, @car.speed]
    assert_equal(expected, results)
  end

end
