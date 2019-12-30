require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem statement

We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future
=end

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

class QuestionTwoTest < Minitest::Test

  def test_1
    # Oracle#predict_the_future was inherited from Oracle class.
    # However, in class RoadTrip the Oracle#choices method is overridden
    # so #sample will sample from ["visit Vegas", "fly to Fiji", "romp in Rome"]
    # vice ["eat a nice lunch", "take a nap soon", "stay at work late"].  This
    # overwrite works because Ruby first starts looking for methods in the current
    # class if it finds the method, the lookup then stops.
    expected = [
      "You will visit Vegas",
      "You will fly to Fiji",
      "You will romp in Rome"
    ]
    assert(expected.include?(RoadTrip.new.predict_the_future))
  end
end