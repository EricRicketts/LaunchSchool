require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Person
  attr_accessor :secret

  def initialize
    @secret = "No secret yet."
  end
end

class ExerciseEightTest < Minitest::Test
  def test_one
    person = Person.new
    first_secret = person.secret
    person.secret = "Shh..  this is a secret!"
    second_secret = person.secret
    expected = [
      "No secret yet.",
      "Shh..  this is a secret!"
    ]
    assert_equal(expected, [first_secret, second_secret])
  end
end