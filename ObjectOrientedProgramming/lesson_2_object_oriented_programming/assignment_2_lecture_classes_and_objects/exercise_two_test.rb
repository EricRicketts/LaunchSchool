=begin
Refer to the problem description in exercise one

Modify the class definition from above to facilitate the following methods.
Note that there is no name= setter method now.

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'
Hint: let first_name and last_name be "states" and create an instance method
called name that uses those states.
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    @first_name = name
    @last_name = ''
  end

  def name
    full_name = @first_name + " " + @last_name
    @last_name.empty? ? @first_name : full_name
  end

end

=begin
I like the LS better than my code because all of the name
assignment is taken care of in the constructor, this makes
the getter #name very simple.  I also like the use of String#strip
to handle the case of first name only where the constructor appends
a space and emtpy string when only the first name is provided.
=end

class LaunchSchoolPerson
  attr_accessor :first_name, :last_name

  def initialize(name)
    parts = name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def name
    "#{@first_name} #{@last_name}".strip
  end

end

class ExerciseTwoTest < Minitest::Test

  def setup
    @bob = Person.new("Robert")
    @elmer = LaunchSchoolPerson.new("Elmer")
  end

  def test_1
    # skip
    expected = ["Robert", "Robert", ""]
    assert_equal(expected, [@bob.name, @bob.first_name, @bob.last_name])
  end

  def test_2
    # skip
    @bob.last_name = "Smith"
    assert_equal("Robert Smith", @bob.name)
  end

  def test_3
    # skip
    expected = ["Elmer", "Elmer", ""]
    assert_equal(expected, [@elmer.name, @elmer.first_name, @elmer.last_name])
  end

  def test_4
    # skip
    @elmer.last_name = "Fudd"
    assert_equal("Elmer Fudd", @elmer.name)
  end

end
