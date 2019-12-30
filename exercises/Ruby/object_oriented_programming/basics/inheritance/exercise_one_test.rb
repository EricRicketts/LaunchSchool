require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
end

class Car < Vehicle
end

class ExerciseOneTest < Minitest::Test
  def test_one
    truck = Truck.new(1994)
    car = Car.new(2006)
    assert_equal([1994, 2006], [truck.year, car.year])
  end
end