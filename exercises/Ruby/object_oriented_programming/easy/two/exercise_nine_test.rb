require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseNineTest < Minitest::Test
  module Walkable
    def walk
      "#{name} #{gait} forward"
    end
  end

  class Person
    include Walkable
    attr_reader :name

    def initialize(name)
      @name = name
    end

    private

    def gait
      "strolls"
    end
  end

  class Cat
    include Walkable
    attr_reader :name

    def initialize(name)
      @name = name
    end

    private

    def gait
      "saunters"
    end
  end

  class Cheetah
    include Walkable
    attr_reader :name

    def initialize(name)
      @name = name
    end

    private

    def gait
      "runs"
    end
  end

  def test_one
    expected = [
      "Mike strolls forward",
      "Kitty saunters forward",
      "Flash runs forward"
    ]
    results = [
      Person.new("Mike").walk,
      Cat.new("Kitty").walk,
      Cheetah.new("Flash").walk
    ]

    assert_equal(expected, results)
  end
end