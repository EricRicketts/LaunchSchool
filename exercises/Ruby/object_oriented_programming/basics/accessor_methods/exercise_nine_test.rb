require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Person
  def age
    @age * 2
  end

  def age=(age)
    @age = age * 2
  end
end

class ExerciseNineTest < Minitest::Test
  def test_one
    person = Person.new
    person.age = 20
    assert_equal(80, person.age)
  end
end