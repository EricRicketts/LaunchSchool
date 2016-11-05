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
end
