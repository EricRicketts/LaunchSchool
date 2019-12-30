require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Person
  def name=(name)
    @first_name, @last_name = name.split
  end

  def name
    [@first_name, @last_name].join(' ')
  end
end

class ExerciseTenTest < Minitest::Test
  def test_one
    person = Person.new
    person.name = "John Doe"
    assert_equal("John Doe", person.name)
  end
end