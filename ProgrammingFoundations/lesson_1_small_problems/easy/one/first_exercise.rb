require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FirstExercise <  Minitest::Test

=begin
Write a method that takes two arguments, a string and a positive integer,
and prints the string as many times as the integer indicates.

Inputs: string, integer
Outputs: prints string to stdout n times

Algorithm: append "\n" to the string and then
multiply the string using the "*" operator
=end

  def repeat(str, repeats)
    (str + "\n") * repeats  
  end

  def repeat_v2(str, repeats)
    repeats.times { puts str }
  end

  def test_repeat
    expected = "hello\nhello\nhello\n"
    assert_output(expected) { puts repeat("hello", 3) }
  end
  
  def test_repeat_v2
    expected = "hello\nhello\nhello\n"
    assert_output(expected) { repeat_v2("hello", 3) }
  end
  
end