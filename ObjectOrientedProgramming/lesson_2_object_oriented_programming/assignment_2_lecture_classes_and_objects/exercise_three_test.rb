=begin
Now create a smart name= method that can take just a first name
or a full name, and knows how to set the first_name and last_name appropriately.

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
bob.first_name            # => 'John'
bob.last_name             # => 'Adams'
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    self.name = name
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end

end

=begin
Again I like the LS solution better as all of the functionality
is put into a private method, there is no need to make expose this
functionality to the class interface.
=end

class LaunchSchoolPerson
  attr_accessor :first_name, :last_name

  def initialize(name)
    parse_full_name(name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end

class ExerciseThreeTest < Minitest::Test

  def setup
    @bob = Person.new("Robert")
    @elmer = LaunchSchoolPerson.new("Elmer")
  end

  def test_1
    # skip
    expected = ["Robert", "Robert", '']
    results = [@bob.name, @bob.first_name, @bob.last_name]
    assert_equal(expected, results)
  end

  def test_2
    # skip
    @bob.last_name = "Smith"
    assert_equal("Robert Smith", @bob.name)
  end

  def test_3
    # skip
    @bob.name = "John Adams"
    expected = ["John", "Adams"]
    results = [@bob.first_name, @bob.last_name]
    assert_equal(expected, results)
  end

  def test_4
    # skip
    expected = ["Elmer", "Elmer", '']
    results = [@elmer.name, @elmer.first_name, @elmer.last_name]
    assert_equal(expected, results)
  end

  def test_5
    # skip
    @elmer.last_name = "Fudd"
    assert_equal("Elmer Fudd", @elmer.name)
  end

  def test_6
    # skip
    @elmer.name = "John Adams"
    expected = ["John", "Adams"]
    results = [@elmer.first_name, @elmer.last_name]
    assert_equal(expected, results)
  end

end
