require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseTenTest < Minitest::Test
  class Vehicle
    attr_reader :make, :model

    def initialize(make, model)
      @make = make
      @model = model
    end

    def to_s
      "#{make} #{model}"
    end
  end

  class Motorcycle < Vehicle
    def wheels
      2
    end
  end

  class Car < Vehicle
    def wheels
      4
    end
  end

  class Truck < Vehicle
    attr_reader :payload

    def initialize(make, model, payload)
      super(make, model)
      @payload = payload
    end

    def wheels
      6
    end
  end

  def test_one
    motorcycle = Motorcycle.new("Kawasaki", 'K100')
    car = Car.new("Dodge", "Charger")
    truck = Truck.new("Dodge", "Ram", 4000)
    expected = [2, 4, 6, 4000]
    results = [motorcycle.wheels, car.wheels, truck.wheels, truck.payload]
    assert_equal(expected, results)
  end
end