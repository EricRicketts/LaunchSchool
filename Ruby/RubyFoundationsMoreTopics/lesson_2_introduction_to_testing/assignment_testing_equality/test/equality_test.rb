require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../code/car'
Minitest::Reporters.use!

class EqualityTest < Minitest::Test
  attr_accessor :car1, :car2

  def setup
    @car1 = Car.new
    @car2 = Car.new
  end

  def test_value_equality
    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2)
    refute_same(car1, car2)
  end
end
