require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Write a program that takes a word problem and returns an integer as an answer

What is 5 plus 13? => 18
What is 7 minus 5? => 2
What is 33 divided by -3? => -11
What is -3 multiplied by 25? => -75

Input: I must assume all input follows the format:
"What \s+ is \s+ \d+ <operation> \s+ \d+?"
Are the operations always 'plus', 'minus', 'divided by', and 'multiplied by'?

Output: assume a number, assume float?

Data Structure: Input is a string read from the command line

Alogrithm:
 - use regex to grab the first number, check for minus sign
 - use regex to grab the operation which is between the two numbers
 - use regex to grad the last number which is before the ?
=end

class WordProblemAsIntegerTest < Minitest::Test

  def solve(str)
    m = str.match(/(-?\d+)\s+(\w+|\w+\s+\w+)\s+(-?\d+)/)
    num1 = m[1].to_f
    operation = m[2]
    num2 = m[3].to_f
    case operation
    when 'plus' then num1 + num2
    when 'minus' then num1 - num2
    when 'multiplied by' then num1 * num2
    when 'divided by' then num1 / num2
    end
  end

  def test_add
    assert_equal(18.0, solve("What is 5 plus 13?"))
  end
  
  def test_minus
    assert_equal(2.0, solve("What is 7 minus 5?"))
  end
  
  def test_divide
    assert_equal(-11.0, solve("What is 33 divided by -3?"))
  end
  
  def test_multiply
    assert_equal(-75.0, solve("What is -3 multiplied by 25?"))
  end
  
end