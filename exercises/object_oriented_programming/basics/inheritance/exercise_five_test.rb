require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

module Towable
  def tow
    "I can tow a trailer!"
  end
end

class Truck
  include Towable
end

class Car
end

class ExerciseFiveTest < Minitest::Test
  def test_one
    truck = Truck.new
    assert_equal('I can tow a trailer!', truck.tow)
  end

  def test_two
    car = Car.new
    refute_respond_to(car, :tow)
  end
end