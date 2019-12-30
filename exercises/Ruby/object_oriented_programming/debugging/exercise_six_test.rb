require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseSixTest < Minitest::Test
  attr_accessor :arr1, :arr2, :arr3

  class LengthBroken
    attr_reader :value, :unit

    def initialize(value, unit)
      @value = value
      @unit = unit
    end

    def as_kilometers
      convert_to(:km, { km: 1, mi: 1.609344, nmi: 1.8519993 })
    end

    def as_miles
      convert_to(:mi, { km: 0.62137119, mi: 1, nmi: 0.8689762419 })
    end

    def as_nautical_miles
      convert_to(:nmi, { km: 0.539957, mi: 1.15078, nmi: 1 })
    end

    def ==(other)
      case unit
      when :km  then value == other.as_kilometers.value
      when :mi  then value == other.as_miles.value
      when :nmi then value == other.as_nautical_miles.value
      end
    end

    def <(other)
      case unit
      when :km  then value < other.as_kilometers.value
      when :mi  then value < other.as_miles.value
      when :nmi then value < other.as_nautical_miles.value
      end
    end

    def <=(other)
      self < other || self == other
    end

    def >(other)
      !(self <= other)
    end

    def >=(other)
      self > other || self == other
    end

    def to_s
      "#{value} #{unit}"
    end

    private

    def convert_to(target_unit, conversion_factors)
      LengthBroken.new((value * conversion_factors[unit]).round(4), target_unit)
    end
  end

  class Length
    attr_reader :value, :unit

    def initialize(value, unit)
      @value = value
      @unit = unit
    end

    def as_kilometers
      convert_to(:km, { km: 1, mi: 1.609344, nmi: 1.8519993 })
    end

    def as_miles
      convert_to(:mi, { km: 0.62137119, mi: 1, nmi: 0.8689762419 })
    end

    def as_nautical_miles
      convert_to(:nmi, { km: 0.539957, mi: 1.15078, nmi: 1 })
    end

    def ==(other)
      case unit
      when :km  then value == other.as_kilometers.value
      when :mi  then value == other.as_miles.value
      when :nmi then value == other.as_nautical_miles.value
      end
    end

    def <(other)
      case unit
      when :km  then value < other.as_kilometers.value
      when :mi  then value < other.as_miles.value
      when :nmi then value < other.as_nautical_miles.value
      end
    end

    def <=(other)
      self < other || self == other
    end

    def >(other)
      !(self <= other)
    end

    def <=>(other)
      return -1 if self < other
      return 0 if self == other
      return 1 if self > other
    end

    def >=(other)
      self > other || self == other
    end

    def to_s
      "#{value} #{unit}"
    end

    private

    def convert_to(target_unit, conversion_factors)
      Length.new((value * conversion_factors[unit]).round(4), target_unit)
    end
  end

  class LengthLS
    include Comparable
    attr_reader :value, :unit

    def initialize(value, unit)
      @value = value
      @unit = unit
    end

    def as_kilometers
      convert_to(:km, { km: 1, mi: 1.609344, nmi: 1.8519993 })
    end

    def as_miles
      convert_to(:mi, { km: 0.62137119, mi: 1, nmi: 0.8689762419 })
    end

    def as_nautical_miles
      convert_to(:nmi, { km: 0.539957, mi: 1.15078, nmi: 1 })
    end

    def <=>(other)
      case unit
      when :km then value <=> other.as_kilometers.value
      when :mi then value <=> other.as_miles.value
      when :nmi then value <=> other.as_nautical_miles.value
      else nil
      end
    end

    def to_s
      "#{value} #{unit}"
    end

    private

    def convert_to(target_unit, conversion_factors)
      LengthLS.new((value * conversion_factors[unit]).round(4), target_unit)
    end
  end

  def setup
    @arr1 = [LengthBroken.new(1, :mi), LengthBroken.new(1, :nmi), LengthBroken.new(1, :km)]
    @arr2 = [Length.new(1, :mi), Length.new(1, :nmi), Length.new(1, :km)]
    @arr3 = [LengthLS.new(1, :mi), LengthLS.new(1, :nmi), LengthLS.new(1, :km)]
  end

  def test_one
    assert_raises(ArgumentError) { arr1.sort }
  end

  def test_two
    expected = ["1 km", "1 nmi", "1 mi"]
    sorted_results = arr2.sort
    results = sorted_results.map(&:to_s)
    assert_equal(expected, results)
  end

  def test_three
    expected = ["1 km", "1 nmi", "1 mi"]
    sorted_results = arr3.sort
    results = sorted_results.map(&:to_s)
    assert_equal(expected, results)
  end
end