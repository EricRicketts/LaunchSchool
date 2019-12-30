require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Person
  attr_writer :name

  def name
    "Mr. #{@name}"
  end
end

class ExerciseSevenTest < Minitest::Test
  def test_one
    person = Person.new
    person.name = 'James'
    assert_equal('Mr. James', person.name)
  end
end