=begin
use the class definitions in exercise two to complete
these exercises.

3.  Draw a class hierarchy diagram of the classes from step #2

4.  What is the method lookup path and how is it important?

Hierarchy => see the attached hierarchy file

=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Pet
  def jump
    "jumping!"
  end

  def run
    "running!"
  end
end

class Dog < Pet
  def speak
    "arf!"
  end

  def fetch
    "fetching!"
  end

  def swim
    "swimming!"
  end
end

class Cat < Pet
  def speak
    "meow!"
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class ExercisesThreeAndFourTest < Minitest::Test

  def test_1
    # skip
    expected = [Bulldog, Dog, Pet, Object, PP::ObjectMixin, Minitest::Expectations, Kernel, BasicObject]
    assert_equal(expected, Bulldog.ancestors)
  end

end
