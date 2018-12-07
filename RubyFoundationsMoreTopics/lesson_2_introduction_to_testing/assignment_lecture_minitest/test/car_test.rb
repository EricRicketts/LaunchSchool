require 'minitest/autorun'
require_relative '../code/car'

class CarTest < Minitest::Test

  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end
end
