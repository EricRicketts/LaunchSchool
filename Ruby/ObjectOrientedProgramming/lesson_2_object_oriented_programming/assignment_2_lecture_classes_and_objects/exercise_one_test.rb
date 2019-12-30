=begin
Given the below usage of the Person class, code the class definition.

bob = Person.new('bob')
bob.name                  # => 'bob'
bob.name = 'Robert'
bob.name                  # => 'Robert'
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Person
  attr_accessor :name

  def initialize(name)
    self.name = name
  end
end

class ExerciseOneTest < Minitest::Test

  def setup
    @person = Person.new('bob')
  end

  def test_1
    # skip
    expected = ['bob', 'Robert']
    initial_name = @person.name
    @person.name = "Robert"
    assert_equal(expected, [initial_name, @person.name])
  end

end
