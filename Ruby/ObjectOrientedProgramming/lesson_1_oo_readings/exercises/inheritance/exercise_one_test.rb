=begin
Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior
that isn't specific to the MyCar class to the superclass. Create a constant in your MyCar
class that stores information about the vehicle that makes it different from other types of Vehicles.

Then create a new class called MyTruck that inherits from your superclass that also has
a constant defined that separates it from the MyCar class in some way.
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Vehicle
  attr_accessor :color, :model, :make, :year, :speed

  def initialize(color, model, make, year)
    self.color = color
    self.model = model
    self.make = make
    self.year = year
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

class MyCar < Vehicle
  REBUILT_ENGINE = true
end

class MyTruck < Vehicle
  TOWED_TRAILER = true
end

class ExerciseOneTest < Minitest::Test

  def setup
    @car = MyCar.new("Orange", "Charger", "Dodge", "1967")
    @truck = MyTruck.new("Black", "3100 Pick Up", "Chevrolet", "1951")
  end

  def test_1
    # skip
    expected = ["Orange", "Charger", "Dodge", "1967", true]
    results = [@car.color, @car.model, @car.make, @car.year, MyCar::REBUILT_ENGINE]
    assert_equal(expected, results)
  end

  def test_2
    # skip
    expected = ["Black", "3100 Pick Up", "Chevrolet", "1951", true]
    results = [@truck.color, @truck.model, @truck.make, @truck.year, MyTruck::TOWED_TRAILER]
    assert_equal(expected, results)
  end

end
