=begin
Use the Launch School solution from exercise three

Using the class definition from step #3, let's create a few more people -- that is, Person objects.

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
the commented out code was my first solution, it was corret
but the LS solution is much better and more concise =>
self.name == other.name since #name returns a string, this
comparison works much better.
=end

class Person
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

  def same_name_as?(other)
    # self.first_name == other.first_name && self.last_name == other.last_name
    self.name == other.name
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end

end

class ExerciseFourTest < Minitest::Test

  def setup
    @bob = Person.new("Robert Smith")
    @rob = Person.new("Robert Smith")
  end

  def test_1
    # skip
    assert(@bob.same_name_as?(@rob))
  end

end
