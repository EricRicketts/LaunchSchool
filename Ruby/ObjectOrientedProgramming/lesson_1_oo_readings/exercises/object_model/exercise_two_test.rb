require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
What is a module? What is its purpose? How do we use them with our classes?
Create a module for the class you created in exercise 1 and include it properly.
=end

module Bar

  def bar
    "bar and foo"
  end
end

class Foo
  include Bar

  def foobar
    "foobar"
  end

end

class ExerciseTwoTest < Minitest::Test

  def test_1
    # skip
    foo = Foo.new
    assert_equal("bar and foo", foo.bar)
  end

end
