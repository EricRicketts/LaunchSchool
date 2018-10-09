require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    super() + "  Drive #{speed}, please!"
  end
end

class ExerciseFourTest < Minitest::Test
  def test_one
    vehicle = Vehicle.new
    truck = Truck.new
    expected = [
      'Ready to go!',
      'Ready to go!  Drive fast, please!'
    ]
    results = [vehicle.start_engine, truck.start_engine('fast')]
    assert_equal(expected, results)
  end
end