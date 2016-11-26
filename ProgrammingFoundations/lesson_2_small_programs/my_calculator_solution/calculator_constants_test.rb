require 'minitest/autorun'
require 'minitest/pride'
require 'yaml'

raw_config = File.read('./config.yml')
APP_CONFIG = YAML.load(raw_config)

# making sure constants module works
class CalculatorConstantsTest < Minitest::Test
  def test_first_number_message
    assert_equal "What's the first number?", APP_CONFIG['FirstNumberMsg']
  end

  def test_second_number_message
    assert_equal "What's the second number?", APP_CONFIG['SecondNumberMsg']
  end

  def test_welcome_message
    msg = "Welcome to Calculator!  Enter your name: "
    assert_equal msg, APP_CONFIG['WelcomeMsg']
  end

  def test_goodbye_message
    msg = "Thank you for using the calculator.  Good bye!"
    assert_equal msg, APP_CONFIG['GoodByeMsg']
  end

  def test_name_error_message
    msg = "Make sure to use a valid name."
    assert_equal msg, APP_CONFIG['NameErrorMsg']
  end

  def test_operator_choice_message
    msg = "Must choose 1, 2, 3, or 4"
    assert_equal msg, APP_CONFIG['OperatorChoiceMsg']
  end

  def test_divide_by_zero_message
    msg = "Oops!!  Cannot divide by zero, choose another number ..."
    assert_equal msg, APP_CONFIG['DivideByZeroMsg']
  end

  def test_incorrect_message
    msg = "Oops!!  I don't understand please input " \
    "(Y/y) to continue or (N/n) to quit."
    assert_equal msg, APP_CONFIG['IncorrectMsg']
  end

  def test_operator_prompt_message
    msg = "What operation would you like to perform? (enter a number)\n" \
    "1) Add\n" \
    "2) Subtract\n" \
    "3) Multiply\n" \
    "4) Divide\n"
    assert_equal msg, APP_CONFIG['OperatorPrompt']
  end

  def test_repeat_calculation_message
    msg = "Do you want to perform another calculation?\n" \
    "(Y/y to calculate again or N/n to quit)\n`"
    assert_equal msg, APP_CONFIG['RepeatCalculationMsg']
  end
end
