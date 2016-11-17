require 'minitest/autorun'
require 'minitest/pride'
require 'yaml'
require_relative './mortgage_calculator'

# tests miscellaneous messages
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
# test valid entries
class MortgageCalculatorTestValidEntries < Minitest::Test
  def test_valid_loans
    valid_loans = [
      "  120  ", "20,000.45", "945.2", "1,000,000.498"
    ]
    valid_loans.each do |number|
      assert valid_loan_amount?(number)
    end
  end

  def test_invalid_loans
    invalid_loans = [
      " ", " 10.001 z ", "98..507", ".01", "100,00"
    ]
    invalid_loans.each do |number|
      refute valid_loan_amount?(number)
    end
  end

  def test_valid_interest
    valid_interests = [
      "5", "5.0", "5.25", "  6.7", "9.8  ", "  15.4  "
    ]
    valid_interests.each do |number|
      assert valid_interest_rate?(number)
    end
  end

  def test_invalid_interest
    invalid_interests = [
      "-5", "5.", "5.xy", "xy6.7", ".55", "101.44", "0", "0.00",
      "00.0000", "00.", ".00"
    ]
    invalid_interests.each do |number|
      refute valid_interest_rate?(number)
    end
  end

  def test_valid_loan_duration
    valid_loan_durations = [
      "  45  ", "50", "  34", "89  ", "360"
    ]
    valid_loan_durations.each do |number|
      assert valid_loan_duration?(number)
    end
  end

  def test_invalid_loan_duration
    invalid_loan_durations = [
      " 1000", "45.6  ", "0", "87.", "-98", "055"
    ]
    invalid_loan_durations.each do |number|
      refute valid_loan_duration?(number)
    end
  end

  def test_leave_program_true
    input = StringIO.new("  y\nY  \n  yes\n  YES  \n")
    n = 1
    while n < 5
      assert leave_program?(stdin: input)
      n += 1
    end
  end

  def test_leave_program_false
    input = StringIO.new("  N\n  \n  xyz\n  $&#!!  \n")
    n = 1
    while n < 5
      refute leave_program?(stdin: input)
      n += 1
    end
  end
end
# test calculations
class MortgageCalculatorTestCalculations < Minitest::Test
  def test_convert_loan_amount_to_float
    input = StringIO.new("1,897,150,034.49\n")
    loan_amount = conv_input_to_num(stdin: input, input_type: "loan_amount")
    assert_equal loan_amount, 1_897_150_034.49
  end

  def test_convert_interest_rate_to_float
    input = StringIO.new("6.78\n")
    interest = conv_input_to_num(stdin: input, input_type: "interest_rate")
    assert_in_delta 0.005650, interest, 0.000001
  end

  def test_convert_loan_duration_to_float
    input = StringIO.new("36\n")
    duration = conv_input_to_num(stdin: input, input_type: "loan_duration")
    assert_equal duration, 36
  end

  def test_basic_calculation
    loan_amount = 20_000
    monthly_interest = (5.0 / 12) / 100
    duration = 36
    monthly_payment = calc_payment(loan_amount, monthly_interest, duration)
    assert_in_delta 599.42, monthly_payment, 0.01
  end
end
