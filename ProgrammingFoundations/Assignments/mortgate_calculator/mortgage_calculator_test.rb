require 'minitest/autorun'
require 'minitest/pride'
require_relative './mortgage_calculator'
require 'byebug'

# test valid entries
class MortgageCalculatorTestValidEntries < Minitest::Test
  def test_valid_loans
    valid_loans = [
      "  120  ", "20000.45", "   945.2", "110.55  ",
      "0.56", "0", "0.00"
    ]
    valid_loans.each do |number|
      assert valid_loan_amount?(number)
    end
  end

  def test_invalid_loans
    invalid_loans = [
      " ", " 10.001 z ", "98..507", ".01", "100,00",
      "1,000,000.45", "."
    ]
    invalid_loans.each do |number|
      refute valid_loan_amount?(number)
    end
  end

  def test_valid_interest
    valid_interests = [
      "5", "5.0", "5.25", "  6.7", "9.8  ", "  15.4  ",
      "8.90874", "0", "0.00"
    ]
    valid_interests.each do |number|
      assert valid_interest_rate?(number)
    end
  end

  def test_invalid_interest
    invalid_interests = [
      "-5", "5.", "5.xy", "xy6.7", ".55", "-5.246",
      "120.45"
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
    $stdin = StringIO.new("  y\nY  \n  yes\n  YES  \n")
    n = 1
    while n < 4
      assert leave_program?
      n += 1
    end
  end

  def test_leave_program_false
    $stdin = StringIO.new("  n\nN  \n  no\n  No  \n")
    n = 1
    while n < 5
      refute leave_program?
      n += 1
    end
  end
end
# test calculations
class MortgageCalculatorTestCalculations < Minitest::Test
  def test_convert_loan_amount_to_float
    $stdin = StringIO.new("1897150034.49\n")
    loan_amt = convert_input_to_number("loan_amount")
    assert_equal loan_amt, 1_897_150_034.49
  end

  def test_convert_interest_rate_to_float
    $stdin = StringIO.new("6.78\n")
    intrst = convert_input_to_number("interest_rate")
    assert_in_delta 0.005650, intrst, 0.000001
  end

  def test_convert_loan_duration_to_float
    $stdin = StringIO.new("10\n")
    length = convert_input_to_number("loan_duration")
    assert_in_delta length, 120.000, 0.001
  end

  def test_basic_calculation
    loan_amount = 20_000
    monthly_interest = (5.0 / 12) / 100
    duration = 36
    monthly_payment = calculate_payment(loan_amount, monthly_interest, duration)
    assert_in_delta 599.42, monthly_payment, 0.01
  end

  def test_zero_interest_calculation
    loan_amount = 20_000
    monthly_interest = 0.00
    duration = 120.0
    monthly_payment = calculate_payment(loan_amount, monthly_interest, duration)
    assert_in_delta 166.67, monthly_payment, 0.01
  end
end
