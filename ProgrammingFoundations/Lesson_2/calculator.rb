require 'byebug'
require 'yaml'

OPERATOR_HASH = {
  '1' => 'Adding', '2' => 'Subtracting',
  '3' => 'Multiplying', '4' => 'Dividing'
}

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  regex = Regexp.new('\A\s*\d+\.?\d*\s*\z')
  regex.match(number)
end

def remove_white_space(str)
  str.strip
end

def convert_str_to_int_or_float(str)
  str.to_i == str.to_f ? str.to_i : str.to_f
end

def name
  prompt("Welcome to Calculator!  Enter your name: ")
  name = ''
  error_msg = "Make sure to use a valid name."
  loop do
    name = gets.chomp
    name.empty? ? prompt(error_msg) : break
  end
  name
end

def format_number(msg)
  number = ''
  error_msg = "Hmm... that doesn't look like a valid number" \
  " or you entered zero"
  loop do
    prompt(msg)
    number = gets.chomp
    valid_number?(number) ? break : prompt(error_msg)
  end
  number = remove_white_space(number)
end

def operation_to_message(operator)
  OPERATOR_HASH[operator]
end

def read_number(msg)
  number = format_number(msg)
  convert_str_to_int_or_float(number)
end

def prompt_for_operation
  operator = ''
  usr_msg = "Must choose 1, 2, 3, or 4"
  loop do
    operator = gets.chomp
    %w(1 2 3 4).include?(operator) ? break : prompt(usr_msg)
  end
  operator
end

def compute_result(operator, num1, num2, msg)
  while num2.zero? && operator == '4'
    prompt("Oops!!  Cannot divide by zero, try again ...")
    num2 = read_number(msg)
  end
  compute_hash = {
    '1' => (num1 + num2), '2' => (num1 - num2),
    '3' => (num1 * num2), '4' => (num1.to_f / num2.to_f)
  }
  prompt("#{operation_to_message(operator)} the two numbers...")
  compute_hash[operator]
end

if __FILE__ == $PROGRAM_NAME
  raw_config = File.read('./config.yml')
  APP_CONFIG = YAML.load(raw_config)
  first_number_msg = APP_CONFIG['GlobalStrings']['FirstNumberMessage']
  second_number_msg = APP_CONFIG['GlobalStrings']['SecondNumberMessage']
  repeat_calc_msg = APP_CONFIG['GlobalStrings']['RepeatCalculationMessage']
  operator_prompt = <<-MSG
    What operation would you like to perform? (enter a numbers)
    1) Add
    2) Subtract
    3) Multiply
    4) Divide
  MSG

  prompt("Hi #{name}")

  loop do # main loop
    number1 = read_number(first_number_msg)
    number2 = read_number(second_number_msg)
    prompt(operator_prompt)

    operator = prompt_for_operation
    result = compute_result(operator, number1, number2, second_number_msg)

    prompt("The result is #{result}")
    prompt(repeat_calc_msg)
    answer = gets.chomp
    break unless answer.downcase().start_with?('y')
  end # main loop

  prompt("Thank you for using the calculator.  Good bye!")
end
