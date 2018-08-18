=begin
Let's create a few more methods for our Dog class.

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end

  def fetch
    'fetching!'
  end
end
Create a new class called Cat, which can do everything a dog can,
except swim or fetch. Assume the methods do the exact same thing.
Hint: don't just copy and paste all methods in Dog into Cat; try
to come up with some class hierarchy.
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
My solution was the exact same as LS, however I originally
had Animal as the superclass vice Pet, Pet is a better name
for the superclass in this case.
=end

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
    'bark!'
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

class ExerciseTwoTest < Minitest::Test

  def setup
    @dog = Dog.new
    @cat = Cat.new
  end

  def test_1
    # skip
    expected = ["bark!", "meow!"]
    assert_equal(expected, [@dog.speak, @cat.speak])
  end

  def test_2
    # skip
    assert_respond_to(@dog, :fetch)
  end

  def test_3
    # skip
    assert_respond_to(@dog, :swim)
  end

  def test_4
    # skip
    refute_respond_to(@cat, :fetch)
  end

  def test_5
    # skip
    refute_respond_to(@cat, :swim)
  end

end
