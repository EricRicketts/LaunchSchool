require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement

You are given the following class that has been implemented:

class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end
end

And the following specification of expected behavior:

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
  => "Plain"

puts donut2
  => "Vanilla"

puts donut3
  => "Plain with sugar"

puts donut4
  => "Plain with chocolate sprinkles"

puts donut5
  => "Custard with icing"

Write additional code for KrispyKreme such that the puts
statements will work as specified above.
=end

class QuestionFiveTest < Minitest::Test
  class KrispyKreme
    def initialize(filling_type, glazing)
      @filling_type = filling_type
      @glazing = glazing
    end

    def to_s
      # @filling_type = "Plain" if @filling_type.nil?
      # @glazing = " with #{@glazing}" unless @glazing.nil?
      # @filling_type.to_s + @glazing.to_s
      # I like the LS solution better
      filling_string = @filling_type ? @filling_type : "Plain"
      glazing_string = @glazing ? " with #{@glazing}" : ''
      filling_string + glazing_string
    end
  end

  def test_1
    donut1 = KrispyKreme.new(nil, nil)
    assert_equal("Plain", "#{donut1}")
  end

  def test_2
    donut2 = KrispyKreme.new("Vanilla", nil)
    assert_equal("Vanilla", "#{donut2}")
  end

  def test_3
    donut3 = KrispyKreme.new(nil, "sugar")
    assert_equal("Plain with sugar", "#{donut3}")
  end

  def test_4
    donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
    assert_equal("Plain with chocolate sprinkles", "#{donut4}")
  end

  def test_5
    donut5 = KrispyKreme.new("Custard", "icing")
    assert_equal("Custard with icing", "#{donut5}")
  end
end