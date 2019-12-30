=begin
Use the results from exercise three and do the following:

Print to the screen your method lookup for the classes that you have created.
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

class ExerciseFourTest < Minitest::Test

  def setup
    @car = MyCar.new("Orange", "Charger", "Dodge", "1967")
    @truck = MyTruck.new("Black", "3100 Pick Up", "Chevrolet", "1951")
  end

  def test_1
    expected = [MyCar, HotRodable, Vehicle, Object, PP::ObjectMixin, Minitest::Expectations, Kernel, BasicObject]
    assert_equal(expected, MyCar.ancestors)
  end

end
