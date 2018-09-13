require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement

You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

What is the result of calling

oracle = Oracle.new
oracle.predict_the_future
=end

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class QuestionOneTest < Minitest::Test

  def test_1
    expected = [
      "You will eat a nice lunch",
      "You will take a nap soon",
      "You will stay at work late"
    ]
    assert(expected.include?(Oracle.new.predict_the_future))
  end
end