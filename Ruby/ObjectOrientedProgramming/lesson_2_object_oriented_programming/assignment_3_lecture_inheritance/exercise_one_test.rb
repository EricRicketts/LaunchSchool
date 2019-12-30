=begin
Given this class:

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"

One problem is that we need to keep track of different breeds of dogs,
since they have slightly different behaviors. For example, bulldogs
can't swim, but all other dogs can.

Create a sub-class from Dog called Bulldog overriding the swim method
to return "can't swim!"
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Dog
  def speak
    "bark!"
  end

  def swim
    "swimming!"
  end

end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class ExerciseOneTest < Minitest::Test

  def setup
    @teddy = Dog.new
    @toby = Bulldog.new
  end

  def test_1
    # skip
    expected = ["bark!", "bark!", "swimming!", "can't swim!"]
    results = [@teddy.speak, @toby.speak, @teddy.swim, @toby.swim]
    assert_equal(expected, results)
  end

end
