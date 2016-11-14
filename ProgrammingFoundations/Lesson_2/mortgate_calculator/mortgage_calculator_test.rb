require 'minitest/autorun'
require 'minitest/pride'
require 'yaml'
require_relative './mortgage_calculator'

raw_config = File.read('./config.yml')
APP_CONFIG = YAML.load(raw_config)

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
    welcome_message = prompt(APP_CONFIG['WelcomeMsg'])
    assert_equal welcome_message, "=> Welcome to the Mortgage Calculator"
  end

  def test_enter_loan_amount_message
    msg = "=> Enter your loan amount.\n" \
    "You must use commas for numbers greater than 999.\n" \
    "Decimals must have at least one digit left of the decimal pont.\n" \
    "What is your loan amount?"
    loan_amt_message = prompt(APP_CONFIG['LoanAmtMsg'])
    assert_equal loan_amt_message, msg
  end

  def test_valid_loans
    valid_loans = [
      "  120  ", "20,000.45", "945.2", "1,000,000.498"
    ]
    valid_loans.each do |number|
      assert valid_loan?(number)
    end
  end

  def test_invalid_loans
    invalid_loans = [
      " ", " 10.001 z ", "98..507", ".01", "100,00"
    ]
    invalid_loans.each do |number|
      refute valid_loan?(number)
    end
  end

  def test_convert_to_float
    input = StringIO.new("1,897,150,034.49\n")
    assert_equal convert_loan_input_to_float(stdin: input), 1_897_150_034.49
  end

  def test_invalid_loan_msg
    msg = "=> Hmm... that doesn't look like a valid loan entry"
    invalid_number_msg = prompt(APP_CONFIG['InvalidLoanMsg'])
    assert_equal invalid_number_msg, msg
  end

  def test_valid_interest
    valid_interests = [
      "5", "5.0", "5.25", "  6.7", "9.8  ", "  15.4  ", "0", "00.00"
    ]
    valid_interests.each do |number|
      assert valid_interest?(number)
    end
  end

  def test_invalid_interest
    invalid_interests = [
      "-5", "5.", "5.xy", "xy6.7", ".55"
    ]
    invalid_interests.each do |number|
      refute valid_interest?(number)
    end
  end

  def test_interest_msg
    msg = "=> Enter your interest amount.\n" \
    "Enter a number representing the percent interest you desire.\n" \
    "Conversion to decimal will be done by the program.\n" \
    "There must be at least one digit to the left of the decimal point.\n" \
    "Zero and negative rates are not allowed.\n" \
    "What is your interest rate?\n"
    interest_amt_msg = prompt(APP_CONFIG['InterestAmtMsg'])
    assert_equal interest_amt_msg, msg
  end
end
