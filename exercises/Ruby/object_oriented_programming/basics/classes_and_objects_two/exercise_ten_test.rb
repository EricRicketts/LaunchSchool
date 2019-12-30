require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Person
  attr_writer :secret

  def compare_secret(other)
    self.secret == other.secret
  end

  protected

  attr_reader :secret
end

class ExerciseNineTest < Minitest::Test
  def test_one
    person1 = Person.new
    person1.secret = 'Shh.. this is a secret!'
    person2 = Person.new
    person2.secret = 'Shh.. this is a different secret!'
    refute(person1.compare_secret(person2))
  end
end