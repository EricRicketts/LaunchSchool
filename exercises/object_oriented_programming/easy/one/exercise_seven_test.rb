require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseSevenTest < Minitest::Test
  class Car1
    attr_accessor :mileage

    def initialize
      @mileage = 0
    end

    def increment_mileage(miles)
      total = mileage + miles
      mileage = total
    end

    def print_mileage
      puts mileage
    end
  end

  class Car2
    attr_accessor :mileage

    def initialize
      @mileage = 0
    end

    def increment_mileage(miles)
      self.mileage = mileage + miles
    end

    def print_mileage
      puts mileage
    end
  end

  def test_one
    car = Car1.new
    car.mileage = 5000
    car.increment_mileage(678)
    assert_output(/5000/) { car.print_mileage }
  end

  def test_two
    car = Car2.new
    car.mileage = 5000
    car.increment_mileage(678)
    assert_output(/5678/) { car.print_mileage }
  end

end