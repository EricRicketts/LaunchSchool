require 'minitest/autorun'
require 'minitest/pride'
require_relative './mortgage_calculator'

# check single line messages
class MortgateCalculatorTestMiscellaneous < Minitest::Test
  def test_welcome_message
    msg = "=> Welcome to the Mortgage Calculator.\n" \
    "This will calculate a monthly payment, based on the loan amount,\n" \
    "a positive interest rate, and loan duration in months.\n"
    welcome_message = prompt(APP_CONFIG['WelcomeMsg'])
    assert_equal welcome_message, msg
  end

  def test_results_message
    results_msg = prompt(APP_CONFIG['ResultMsg'])
    assert_equal results_msg, "=> Monthly payments are: "
  end

  def test_quit_message
    quit_msg = prompt(APP_CONFIG['QuitMsg'])
    msg = "=> Calculate another monthly payment(Y/y to continue)?"
    assert_equal quit_msg, msg
  end

  def test_goodbye_message
    goodbye = prompt(APP_CONFIG['GoodByeMsg'])
    msg = "=> Thank you for using mortgage calculator.  Good bye!"
    assert_equal goodbye, msg
  end

  def test_invalid_loan_amount_msg
    msg = "=> Hmm... that doesn't look like a valid loan amount entry"
    invalid_number_msg = prompt(APP_CONFIG['InvalidLoanMsg'])
    assert_equal invalid_number_msg, msg
  end

  def test_invalid_interest_msg
    msg = "=> Hmm... that doesn't look like a valid interest rate entry"
    invalid_interest_msg = prompt(APP_CONFIG['InvalidInterestMsg'])
    assert_equal invalid_interest_msg, msg
  end

  def test_invalid_loan_duration_msg
    msg = "=> Hmm... that doesn't look like a valid loan duration entry"
    invalid_loan_duration_msg = prompt(APP_CONFIG['InvalidLoanDurationMsg'])
    assert_equal invalid_loan_duration_msg, msg
  end
end
# check lengthy messages
class MortgageCalculatorTestBigMessages < Minitest::Test
  def test_enter_loan_amount_message
    msg = "=> Enter your loan amount.\n" \
    "You must use commas for numbers greater than 999.\n" \
    "Decimals must have at least one digit left of the decimal pont.\n" \
    "Negative numbers are not allowed.\n" \
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
    "The entry must be less than 1,000 and cannot have decimals.\n" \
    "Negative numbers or zero are not allowed.\n" \
    "The loan duration cannot start with zero.\n" \
    "What is the loan duration in months?\n"
    loan_duration_msg = prompt(APP_CONFIG['LoanDurationMsg'])
    assert_equal loan_duration_msg, msg
  end
end