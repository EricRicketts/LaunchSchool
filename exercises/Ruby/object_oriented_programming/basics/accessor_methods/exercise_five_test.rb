require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Person
  attr_writer :age

  def older_than?(other)
    age > other.age
  end

  protected

  attr_reader :age
end

class ExerciseFiveTest < Minitest::Test
  def test_one
    person1 = Person.new
    person2 = Person.new
    person1.age = 17
    person2.age = 26

    refute(person1.older_than?(person2))
  end
end