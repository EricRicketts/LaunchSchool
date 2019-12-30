require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Person
  attr_writer :secret

  def initialize
    @secret = "No secret yet."
  end

  def share_secret
    secret
  end

  private

  attr_reader :secret
end

class ExerciseNineTest < Minitest::Test
  def test_one
    person = Person.new
    person.secret = 'Shh.. this is a secret!'
    assert('Shh.. this is a secret!', person.share_secret)
  end
end