require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement

Building on the prior vehicles question, we now must also track a basic motorboat.
A motorboat has a single propeller and hull, but otherwise behaves similar to a catamaran.
Therefore, creators of Motorboat instances don't need to specify number of hulls or propellers.
How would you modify the vehicles code to incorporate a new Motorboat class?
=end

class QuestionThreeTest < Minitest::Test

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

  class Boat
    include Moveable

    def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
      self.fuel_efficiency = km_traveled_per_liter
      self.fuel_capacity = liters_of_fuel_capacity
    end
  end

  class Catamaran < Boat
    attr_accessor :propeller_count, :hull_count

    def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
      super(km_traveled_per_liter, liters_of_fuel_capacity)
      @propeller_count = num_propellers
      @hull_count = num_hulls
    end
  end

  class Motorboat < Boat
  end

  attr_accessor :catamaran, :motorboat

  def setup
    @catamaran = Catamaran.new(2, 2, 10, 30.0)
    @motorboat = Motorboat.new(15, 15.0)
  end

  def test_1
    assert_equal(300.0, catamaran.range)
  end

  def test_2
    assert_equal(225.0, motorboat.range)
  end
end

class QuestionThreeTestLSAnswer < Minitest::Test

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
    include Moveable
    attr_accessor :propeller_count, :hull_count

    def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
      self.propeller_count = num_propellers
      self.hull_count = num_hulls
      self.fuel_efficiency = km_traveled_per_liter
      self.fuel_capacity = liters_of_fuel_capacity
    end
  end

  class Catamaran < Seacraft
  end

  class Motorboat < Seacraft
    def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
      super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
    end
  end

  # I had the same basic idea as the LS solution but again they
  # made better implementation decisions.  One had to make a
  # superclass which both Catamaran and Motorboat could inherit
  # from.  Again, part of the problem was my interpretation of
  # what LS wanted.  I designed it so that Motorboat had no number
  # of hulls or number of propellers since everything was understood
  # to be one.  However, LS just did not want it set by a parameter
  # passed into the constructor but for it to default to one.  Again,
  # I think the LS solution is more robust and cleaner than what I did.
  attr_accessor :catamaran, :motorboat

  def setup
    @catamaran = Catamaran.new(2, 2, 10, 30.0)
    @motorboat = Motorboat.new(15, 15.0)
  end

  def test_1
    assert_equal(300.0, catamaran.range)
  end

  def test_2
    assert_equal(225.0, motorboat.range)
  end
end
