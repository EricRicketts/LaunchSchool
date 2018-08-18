=begin
pick up the definition from exercise four for class Person

Continuing with our Person class definition, what does the below print out?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

See Output

Let's add a to_s method to the class:

class Person
  # ... rest of class omitted for brevity

  def to_s
    name
  end
end
Now, what does the below output?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

See Output

=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class OldPerson
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

class NewPerson < OldPerson

  def to_s
    self.name
  end

end

class ExericseFiveTest < Minitest::Test

  def setup
    @bob = OldPerson.new("Robert Smith")
    @rob = NewPerson.new("Robert Smith")
  end

  def test_1
    # skip
    output = "The person's name is #{@bob}"
    assert_match(/OldPerson/, output)
  end

  def test_2
    # skip
    output = "The person's name is #{@rob}"
    assert_equal("The person's name is Robert Smith", output)
  end

end
