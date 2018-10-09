require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  def initialize(year)
    super(year)
    start_engine
  end

  def start_engine
    puts "Ready to go!"
  end
end

class ExerciseTwoTest < Minitest::Test
  def test_one
    truck = ''
    assert_output(/Ready to go!/) { truck = Truck.new(1994) }
    assert(1994 == truck.year)
  end
end