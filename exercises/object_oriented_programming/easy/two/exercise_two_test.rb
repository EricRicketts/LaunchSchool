require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseTwoTest < Minitest::Test
  module Driveable
    def drive
      "I am driving!"
    end
  end

  class Car
    include Driveable
  end

  def test_one
    assert_equal("I am driving!", Car.new.drive)
  end
end