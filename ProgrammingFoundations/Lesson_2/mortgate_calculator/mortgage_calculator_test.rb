require 'minitest/autorun'
require 'minitest/pride'
require_relative './mortgage_calculator'

# tests for mortgage calculator program
class MortgateCalculatorTest < Minitest::Test
  def test_basic_calculation
    loan_amount = 20_000
    monthly_interest = (5.0 / 12) / 100
    duration = 36
    monthly_payment = monthly_payment(loan_amount, monthly_interest, duration)
    assert_in_delta 599.42, monthly_payment, 0.01
  end

  def test_welcome
    assert_equal welcome_message, "=> Welcome to the Mortgage Calculator"
  end

  def test_enter_loan_amount_message
    msg = "=> Enter your loan amount.\n" \
    "You must use commas for numbers greater than 999.\n" \
    "Decimals must have at least one digit left of the decimal pont.\n" \
    "What is your loan amount?"
    assert_equal loan_amt_message, msg
  end

  def test_valid_numbers
    valid_numbers = [
      "  120  ",
      "20,000.45",
      "945.2",
      "1,000,000.498"
    ]
    valid_numbers.each do |number|
      assert valid_number?(number)
    end
  end

  def test_invalid_numbers
    invalid_numbers = [
      " ",
      " 10.001 z ",
      "98..507",
      ".01",
      "100,00"
    ]
    invalid_numbers.each do |number|
      refute valid_number?(number)
    end
  end

  def test_convert_to_float
    input = StringIO.new("1,897,150,034.49\n")
    assert_equal convert_input_to_float(stdin: input), 1_897_150_034.49
  end

  def test_invalid_number_msg
    msg = "=> Hmm... that doesn't look like a valid number"
    assert_equal invalid_number_msg, msg
  end
end
