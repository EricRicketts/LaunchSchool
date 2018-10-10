require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Person

  def initialize(name)
    @name = name
  end

  def name
    @name.dup
  end
end

class ExerciseEightTest < Minitest::Test
  def test_one
    person = Person.new('James')
    reversed_name = person.name.reverse!
    assert_equal(%w(semaJ James), [reversed_name, person.name])
  end
end