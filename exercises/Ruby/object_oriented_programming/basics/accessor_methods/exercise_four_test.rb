require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Person
  attr_accessor :first_name
  attr_writer :last_name

  def first_equals_last?
    first_name == last_name
  end

  private

  attr_reader :last_name
end

class ExerciseFourTest < Minitest::Test
  def test_one
    person = Person.new
    person.first_name = "Dave"
    person.last_name = "Smith"
    refute(person.first_equals_last?)
    assert_raises(NoMethodError) { person.last_name }
  end
end