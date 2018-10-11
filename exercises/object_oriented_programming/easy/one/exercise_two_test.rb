require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

  class Pet1
    attr_reader :name

    def initialize(name)
      @name = name.to_s
    end

    def to_s
      @name.upcase!
      "My name is #{@name}."
    end
  end

  class Pet2
    attr_reader :name

    def initialize(pet_name)
      @name = pet_name.to_s
    end

    def to_s
      "My name is #{name.upcase}."
    end
  end

class ExerciseTwoTest < Minitest::Test

  def test_one
    pet_name = 'Fluffy'
    pet = Pet1.new(pet_name)
    first = pet.name.dup
    second = pet.to_s
    third = pet.name
    results = [first, second, third, pet_name]
    expected = [
      "Fluffy", "My name is FLUFFY.",
      "FLUFFY", "FLUFFY"
    ]
    assert_equal(expected, results)
  end

  def test_two
    pet_name = 'Fluffy'
    pet = Pet2.new(pet_name)
    first = pet.name
    second = pet.to_s
    third = pet.name
    results = [first, second, third, pet_name]
    expected = [
      "Fluffy", "My name is FLUFFY.",
      "Fluffy", "Fluffy"
    ]
    assert_equal(expected, results)
  end

  def test_three
    # this works because in the constructor #to_s is
    # called on an integer
    name = 42
    fluffy = Pet1.new(name)
    name += 1
    first = fluffy.name.dup
    second = fluffy.to_s
    third = fluffy.name
    fourth = name
    results = [first, second, third, fourth]
    expected = [
      "42", "My name is 42.", "42", 43
    ]
    assert_equal(expected, results)
  end
end