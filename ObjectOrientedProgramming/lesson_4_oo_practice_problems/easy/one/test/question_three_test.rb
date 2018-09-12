require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement:

In the last question we had a module called Speed which contained a go_fast method.
We included this module in the Car class as shown below.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end
When we called the go_fast method from an instance of the Car class (as shown below)
you might have noticed that the string printed when we go fast includes the name of
the type of vehicle we are using. How is this done?

>> small_car = Car.new
>> small_car.go_fast
I am a Car and going super fast!
=end

module Speed
  def go_fast
    "I am a #{self.class} and going super fast!"
  end

  def my_class
    self.class
  end
end

class Car
  include Speed
  def go_slow
    "I am safe and driving slow."
  end
end

class QuestionThreeTest < Minitest::Test
  def test_1
    # self refers to the object itself, which in this
    # case is a Car object.  Then we just call the #class
    # method on the Car object to return the class.  String
    # interpolation is preformed by #{} to #to_s is called
    # on the return from #class.
    assert_equal(Car, Car.new.my_class)
  end
end