require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Person
  attr_reader :phone_number

  def initialize(phone_number)
    @phone_number = phone_number
  end

  private

  attr_writer :phone_number
end

=begin
Launch School solution better because now we
can only set the instance variable from within the class

class Person
  attr_reader :phone_number

  def initialize(phone_number)
    @phone_number = phone_number
  end
end

=end

class ExerciseThreeTest < Minitest::Test
  def test_one
    person = Person.new(1234567899)
    assert_equal(1234567899, person.phone_number)
    assert_raises(NoMethodError) { person.phone_number = 9987654321 }
  end
end