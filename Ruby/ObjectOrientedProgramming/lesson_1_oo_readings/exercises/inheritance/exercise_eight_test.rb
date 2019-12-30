=begin
Given the following code...

bob = Person.new
bob.hi

And the corresponding error message...

NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
from (irb):8
from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

What is the problem and how would you go about fixing it?

make #hi a public method
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class FlawedPerson

  private

  def hi
    "Hi"
  end
end

class CorrectPerson

  def hi
    "Hi"
  end
end

class ExerciseEightTest < Minitest::Test

  def setup
    @flawed = FlawedPerson.new
    @correct = CorrectPerson.new
  end

  def test_1
    # skip
    assert_raises(NoMethodError) { @flawed.hi }
  end

  def test_2
    # skip
    assert_equal("Hi", @correct.hi)
  end

end
