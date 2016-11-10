require 'minitest/autorun'
require 'minitest/pride'
require_relative './constants'


# making sure constants module works
class CalculatorConstantsTest < Minitest::Test

  def setup
    @operator_prompt = "What operation would you like to perform? " \
    "(enter a number)\n" \
    "1) Add\n" \
    "2) Subtract\n" \
    "3) Multiply\n" \
    "4) Divide"
  end

  def test_first_number_message
    assert_equal "What's the first number?", Constants::FIRST_NUMBER_MSG
  end

  def test_operator_hash
    assert_equal 'Multiplying', Constants::OPERATOR_HASH['3']
  end

  def test_operator_prompt
    assert_equal @operator_prompt, Constants::OPERATOR_PROMPT
  end
end
