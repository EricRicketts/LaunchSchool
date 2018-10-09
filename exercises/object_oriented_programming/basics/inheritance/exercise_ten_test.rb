require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

module Transportation
  class Vehicle; end
  class Car < Vehicle; end
  class Truck < Vehicle; end
end

$ancestors = Transportation::Car.ancestors
$ancestors.delete(PP::ObjectMixin)
$ancestors.delete(Minitest::Expectations)

class ExerciseTenTest < Minitest::Test
  def test_one
    vehicle = Transportation::Vehicle.new
    car = Transportation::Car.new
    truck = Transportation::Truck.new
    expected = [
      Transportation::Car, Transportation::Vehicle,
      Object, Kernel, BasicObject
    ]
    assert_equal(expected, $ancestors)
  end

  def test_two
    car = Transportation::Car.new
    assert_instance_of(Transportation::Car, car)
  end
end