require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement

The designers of the vehicle management system now want to make an adjustment
for how the range of vehicles is calculated. For the seaborne vehicles, due to
prevailing ocean currents, they want to add an additional 10km of range even
if the vehicle is out of fuel.

Alter the code related to vehicles so that the range for autos and motorcycles
is still calculated as before, but for catamarans and motorboats, the range
method will return an additional 10km.
=end

class QuestionFourTest < Minitest::Test

  module Moveable
    attr_accessor :speed, :heading
    attr_writer :fuel_capacity, :fuel_efficiency

    def range
      @fuel_capacity * @fuel_efficiency
    end
  end

  class WheeledVehicle
    include Moveable

    def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
      @tires = tire_array
      self.fuel_efficiency = km_traveled_per_liter
      self.fuel_capacity = liters_of_fuel_capacity
    end

    def tire_pressure(tire_index)
      @tires[tire_index]
    end

    def inflate_tire(tire_index, pressure)
      @tires[tire_index] = pressure
    end
  end

  class Auto < WheeledVehicle
    def initialize
      super([30, 30, 32, 32], 50, 25.0)
    end
  end

  class Motorcycle < WheeledVehicle
    def initialize
      super([20, 20], 80, 8.0)
    end
  end

  class Seacraft
    # I did not know this could work, calling super in this case refers to
    # the range method defined in Moveable, I was not sure if the hiearchy
    # applied in this case but it holds even for modules.  I guess it makes
    # sense in the module look up path the name of the Seacraft method is range
    # so Ruby will look for another method called range in the method lookup
    # path, so it finds one in the Moveable module and then calls it.  We now
    # just take the return value and add 10.0 to it.
    include Moveable
    attr_accessor :propeller_count, :hull_count

    def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
      self.propeller_count = num_propellers
      self.hull_count = num_hulls
      self.fuel_efficiency = km_traveled_per_liter
      self.fuel_capacity = liters_of_fuel_capacity
    end

    def range
      super + 10.0
    end
  end

  class Catamaran < Seacraft
  end

  class Motorboat < Seacraft
    def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
      super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
    end
  end

  attr_accessor :motorboat, :motorcycle

  def setup
    @motorboat = Motorboat.new(15, 15.0)
    @motorcycle = Motorcycle.new
  end

  def test_1
    assert_equal(235.0, motorboat.range)
  end

  def test_2
    assert_equal(640.0, motorcycle.range)
  end
end