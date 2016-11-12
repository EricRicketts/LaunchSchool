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
    assert_equal loan_amt_message, "=> What is the loan amount? "
  end

  def test_valid_numbers
    valid_numbers = ["3", "   4.5", "8.99   ", "  120  "]
    valid_numbers.each do |number|
      assert valid_number?(number)
    end
  end

  def test_invalid_numbers
    invalid_numbers = [" ", "45x", " 10.001 z ", "  xy444", "98..507"]
    invalid_numbers.each do |number|
      refute valid_number?(number)
    end
  end

  def test_invalid_number_msg
    msg = "=> Hmm... that doesn't look like a valid number"
    assert_equal invalid_number_msg, msg
  end
end
