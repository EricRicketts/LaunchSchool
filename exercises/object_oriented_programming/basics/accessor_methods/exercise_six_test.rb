require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Person
  attr_reader :name

  def name=(new_name)
    @name = new_name.capitalize
  end
end

class ExerciseSixTest < Minitest::Test
  def test_one
    person = Person.new
    person.name = 'eLiZaBeTh'
    assert_equal('Elizabeth', person.name)
  end
end