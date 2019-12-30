require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Person
  attr_accessor :name
end

class ExerciseOneTest < Minitest::Test
  def test_one
    person = Person.new
    person.name = 'Jessica'
    assert_equal('Jessica', person.name)
  end
end