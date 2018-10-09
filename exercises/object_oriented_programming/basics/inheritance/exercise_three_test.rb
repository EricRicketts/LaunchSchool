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
  attr_reader :bed_type

  def initialize(year, bed_type)
    super(year)
    @bed_type = bed_type
  end
end

class Car < Vehicle
end

class ExerciseThreeTest < Minitest::Test
  def test_one
    truck = Truck.new(1994, 'Short')
    car = Car.new(2006)
    expected = [1994, 2006, 'Short']
    assert_equal(expected, [truck.year, car.year, truck.bed_type])
  end
end