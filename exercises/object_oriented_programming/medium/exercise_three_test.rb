require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseThreeTest < Minitest::Test
  class Student
    def initialize(name, year)
      @name = name
      @year = year
    end
  end

  class Undergraduate < Student
    def initialize(name, year)
      super(name, year)
      @parking = false
    end
  end

  class Graduate < Student
    def initialize(name, year, parking)
      super(name, year)
      @parking = parking
    end
  end

  def test_one
    undergrad = Undergraduate.new("Elmer Fudd", 20)
    grad = Graduate.new("Bugs Bunny", 26, true)
    assert(grad.instance_variable_get("@parking"))
  end
end