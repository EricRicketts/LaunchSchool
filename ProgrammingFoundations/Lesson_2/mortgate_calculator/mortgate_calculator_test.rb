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
    assert_equal welcome_message, "=> Welcome to the Mortgate Calculator"
  end
end
