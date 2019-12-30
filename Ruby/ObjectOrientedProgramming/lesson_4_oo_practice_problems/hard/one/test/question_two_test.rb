require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement

Ben and Alyssa are working on a vehicle management system. So far, they have created
classes called Auto and Motorcycle to represent automobiles and motorcycles. After
having noticed common information and calculations they were performing for each type
of vehicle, they decided to break out the commonality into a separate class called
WheeledVehicle. This is what their code looks like so far:

class WheeledVehicle
  attr_accessor :speed, :heading

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end
Now Alan has asked them to incorporate a new type of vehicle into their system - a Catamaran defined as follows:

class Catamaran
  attr_accessor :propeller_count, :hull_count, :speed, :heading

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    # ... code omitted ...
  end
end

This new class does not fit well with the object hierarchy defined so far. Catamarans don't have tires.
But we still want common code to track fuel efficiency and range. Modify the class definitions and move
code into a Module, as necessary, to share code among the Catamaran and the wheeled vehicles.
=end

class QuestionTwoTest < Minitest::Test

  module Mileage
    attr_accessor :speed, :heading

    def set_mileage_and_capacity(km_traveled_per_liter, liters_of_fuel_capacity)
      @fuel_capacity = km_traveled_per_liter
      @fuel_efficiency = liters_of_fuel_capacity
    end

    def range
      @fuel_capacity * @fuel_efficiency
    end
  end

  class WheeledVehicle
    include Mileage

    def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
      @tires = tire_array
      set_mileage_and_capacity(km_traveled_per_liter, liters_of_fuel_capacity)
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

  class Catamaran
    include Mileage
    attr_accessor :propeller_count, :hull_count

    def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
      @propeller_count = num_propellers
      @hull_count = num_hulls
      set_mileage_and_capacity(km_traveled_per_liter, liters_of_fuel_capacity)
    end
  end

  def test_1
    catamaran = Catamaran.new(2, 2, 10, 30.0)
    assert_equal(300.0, catamaran.range)
  end
end

class QuestionTwoTestLSAnswer < Minitest::Test

  # this is a much better solution than my one above
  # making :fuel_capacity and :fuel_efficiency attribute
  # writers meant I could get rid of the separate method
  # to initialize them, they could just be set by calling
  # the setter methods.
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

  class Catamaran
    include Moveable
    attr_accessor :propeller_count, :hull_count

    def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
      @propeller_count = num_propellers
      @hull_count = num_hulls
      self.fuel_efficiency = km_traveled_per_liter
      self.fuel_capacity = liters_of_fuel_capacity
    end
  end

  def test_1
    catamaran = Catamaran.new(2, 2, 10, 30.0)
    assert_equal(300.0, catamaran.range)
  end
end
