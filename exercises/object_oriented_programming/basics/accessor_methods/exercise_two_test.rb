require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Person
  attr_accessor :name
  attr_writer :phone_number
end

class ExerciseTwoTest < Minitest::Test
  def test_one
    person = Person.new
    person.name = 'Jessica'
    person.phone_number = '703-451-0235'
    expected = [
      'Jessica', '703-451-0235'
    ]
    results = [person.name, person.instance_variable_get('@phone_number')]
    assert_equal(expected, results)
  end
end