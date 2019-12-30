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

  class Noble
    attr_reader :name, :title

    def initialize(name, title)
      @name = name
      @title = title
    end

    def walk
      "#{title} #{name} #{gait} forward"
    end

    private

    def gait
      "struts"
    end
  end

  def test_one
    byron = Noble.new("Byron", "Lord")

    expected = [
      "Mike strolls forward",
      "Kitty saunters forward",
      "Flash runs forward",
      "Lord Byron struts forward",
      "Byron",
      "Lord"
    ]
    results = [
      Person.new("Mike").walk,
      Cat.new("Kitty").walk,
      Cheetah.new("Flash").walk,
      Noble.new("Byron", "Lord").walk,
      byron.name,
      byron.title
    ]

    assert_equal(expected, results)
  end
end