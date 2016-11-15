require 'minitest/autorun'
require 'minitest/pride'
require 'yaml'
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
    welcome_message = prompt(APP_CONFIG['WelcomeMsg'])
    assert_equal welcome_message, "=> Welcome to the Mortgage Calculator"
  end

  def test_enter_loan_amount_message
    msg = "=> Enter your loan amount.\n" \
    "You must use commas for numbers greater than 999.\n" \
    "Decimals must have at least one digit left of the decimal pont.\n" \
    "Zero and negative numbers are not allowed.\n" \
    "What is your loan amount?\n"
    loan_amt_message = prompt(APP_CONFIG['LoanAmtMsg'])
    assert_equal loan_amt_message, msg
  end

  def test_interest_msg
    msg = "=> Enter your interest amount.\n" \
    "The number must be an annual interest rate number.\n" \
    "Enter a number representing the percent interest you desire.\n" \
    "Conversion to decimal will be done by the program.\n" \
    "There must be at least one digit to the left of the decimal point.\n" \
    "There cannot be more than two digits to the left of the decimal point.\n" \
    "Zero and negative rates are not allowed.\n" \
    "What is your interest rate?\n"
    interest_amt_msg = prompt(APP_CONFIG['InterestAmtMsg'])
    assert_equal interest_amt_msg, msg
  end

  def test_loan_duration_msg
    msg = "=> Enter your loan duration in months.\n" \
    "No decimal numbers are allowed.\n" \
    "Neither are negative numbers or zero.\n" \
    "What is the loan duration in months?\n"
    loan_duration_msg = prompt(APP_CONFIG['LoanDurationMsg'])
    assert_equal loan_duration_msg, msg
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

  def test_convert_loan_to_float
    input = StringIO.new("1,897,150,034.49\n")
    loan = convert_input_to_number(stdin: input, input_type: "loan")
    assert_equal loan, 1_897_150_034.49
  end

  def test_convert_interest_rate_to_float
    input = StringIO.new("6.78\n")
    interest = convert_input_to_number(stdin: input, input_type: "interest")
    assert_in_delta 0.005650, interest, 0.000001
  end

  def test_invalid_loan_msg
    msg = "=> Hmm... that doesn't look like a valid loan entry"
    invalid_number_msg = prompt(APP_CONFIG['InvalidLoanMsg'])
    assert_equal invalid_number_msg, msg
  end

  def test_invalid_interest_msg
    msg = "=> Hmm... that doesn't look like a valid interest rate entry"
    invalid_interest_msg = prompt(APP_CONFIG['InvalidInterestMsg'])
    assert_equal invalid_interest_msg, msg
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
      "-5", "5.", "5.xy", "xy6.7", ".55", "101.44"
    ]
    invalid_interests.each do |number|
      refute valid_interest?(number)
    end
  end

end
