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

  def test_strip_spaces
    numbers = ["  3.5  ", "  4", "5.55  "]
    numbers.each do |number|
      pure_number = remove_white_space(number)
      refute_match(/\s+/, pure_number)
    end
  end

  def test_string_to_integer
    number = "4546"
    assert_equal convert_str_to_int_or_float(number), 4546
  end

  def test_string_to_float
    number = "456.789"
    assert_equal convert_str_to_int_or_float(number), 456.789
  end
end
