require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

module Towable
  def tow
    "I can tow a trailer!"
  end
end

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  include Towable
end

class Car < Vehicle
end

class ExerciseSixTest < Minitest::Test
  def test_one
    truck = Truck.new(1994)
    car = Car.new(2006)
    expected = [
      1994, 2006, 'I can tow a trailer!'
    ]
    results = [truck.year, car.year, truck.tow]
    assert_equal(expected, results)
  end
end