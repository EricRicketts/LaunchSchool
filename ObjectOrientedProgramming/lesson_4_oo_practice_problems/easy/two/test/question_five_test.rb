require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statemetn

There are a number of variables listed below.
What are the different types and how do you know which is which?

excited_dog = "excited dog"
@excited_dog = "excited dog"
@@excited_dog = "excited dog"
=end

class ExcitedDog
  @@excited_dog = 0

  attr_reader :excited_dog

  def self.number
    @@excited_dog
  end

  def self.reset
    @@excited_dog = 0
  end

  def initialize
    @excited_dog = false
  end

  def now_excited
    @excited_dog = true
    @@excited_dog += 1
  end

  def now_calm
    @excited_dog = false
    @@excited_dog -= 1
  end

  def to_s
    excited_dog = "I am a Excited Dog!!"
    excited_dog
  end
end

class QuestionFiveTest < Minitest::Test
  attr_accessor :dog1, :dog2

  def setup
    @dog1 = ExcitedDog.new
    @dog2 = ExcitedDog.new
  end

  def teardown
    ExcitedDog.reset
  end

  def test_1
    # any variable preceeded by '@' is an instance
    # variable, which state can vary on an object
    # by objedt basis
    dog1.now_excited
    assert_equal([true, false], [dog1.excited_dog, dog2.excited_dog])
  end

  def test_2
    # any variable preceeded by '@@' is a class
    # variable which is at the class level and
    # therefore available to all instances
    starting_state = ExcitedDog.number
    dog1.now_excited
    dog2.now_excited
    current_state = ExcitedDog.number
    assert_equal(2, current_state)
  end

  def test_3
    # if the variable is not preceeded by '@' or '@@'
    # then it is a local variable, note in ExcitedDog#to_s
    # excited dog was a log variable because I initialized
    # it to a String Object and since :excited_dog only had
    # a reader attribute in that particular method body
    # it had to be a local variable.
    assert_equal("I am a Excited Dog!!", dog1.to_s)
  end
end