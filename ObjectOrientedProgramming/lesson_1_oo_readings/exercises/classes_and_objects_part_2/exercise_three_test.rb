=begin
Run the following code and fix the errors
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class FaultyPerson
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class CorrectPerson
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class ExerciseThreeTest < Minitest::Test

  def setup
    @person1 = FaultyPerson.new("Steven")
    @person2 = CorrectPerson.new("Elmer")
  end

  def test_1
    # skip
    assert_raises(NoMethodError) { @person1.name = "Bob" }
  end

  def test_2
    # skip
    original = @person2.name
    @person2.name = "Bob"
    assert_equal(["Elmer", "Bob"], [original, @person2.name])
  end

end
