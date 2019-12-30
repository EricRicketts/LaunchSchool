require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
How do we create an object in Ruby? Give an example of the creation of an object.
=end

class Foo

  def foobar
    "foobar"
  end
end

class ExerciseTest < Minitest::Test

  def test_1
    # skip
    foo = Foo.new
    assert(foo.class == Foo)
  end

end
