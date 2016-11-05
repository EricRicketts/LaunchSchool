require 'minitest/autorun'
require 'minitest/pride'
require 'stringio'
require_relative './ui'
require_relative './calculator'

# Test for my own refactoring of the calculator program
class CalculatorTest < Minitest::Test
  def test_prompt
    out = capture_io do
      prompt("Hello, Jimmy")
    end
    assert_equal out[0], "=> Hello, Jimmy\n"
  end

  def test_valid_numbers
    valid_numbers = ["3", "   4.5", "8.99   ", "  120  "]
    valid_numbers.each do |number|
      assert valid_number?(number)
    end
  end

  def test_invalid_numbers
    invalid_numbers = [" ", "45x", " 10.001 z ", "  xy444"]
    invalid_numbers.each do |number|
      refute valid_number?(number)
    end
  end
end
