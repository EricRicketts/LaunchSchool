require_relative './constants'

def compute_result(operator, num1, num2, msg)
  while num2.zero? && operator == '4'
    prompt(Constants::DIVIDE_BY_ZERO_MSG)
    num2 = read_number(msg)
  end
  compute_hash = {
    '1' => (num1 + num2), '2' => (num1 - num2),
    '3' => (num1 * num2), '4' => (num1.to_f / num2.to_f)
  }
  prompt("#{operation_to_message(operator)} the two numbers...")
  compute_hash[operator]
end

def convert_str_to_int_or_float(str)
  str.to_i == str.to_f ? str.to_i : str.to_f
end

def format_number(msg)
  number = ''
  error_msg = Constants::NUMBER_ERROR_MSG
  loop do
    prompt(msg)
    number = gets.chomp
    valid_number?(number) ? break : prompt(error_msg)
  end
  number = remove_white_space(number)
end

def name
  prompt(Constants::WELCOME_MSG)
  name = ''
  loop do
    name = gets.chomp
    name.empty? ? prompt(Constants::NAME_ERROR_MSG) : break
  end
  name
end

def operation_to_message(operator)
  Constants::OPERATOR_HASH[operator]
end

def print_result(result)
  prompt("The result is #{result}")
  prompt(Constants::REPEAT_CALC_MSG)
end

def prompt(message)
  puts "=> #{message}"
end

def prompt_for_operation
  prompt(Constants::OPERATOR_PROMPT)
  operator = ''
  operator_choice = Constants::OPERATOR_CHOICE
  loop do
    operator = gets.chomp
    %w(1 2 3 4).include?(operator) ? break : prompt(operator_choice)
  end
  operator
end

def read_in_numbers
  num1 = read_number(Constants::FIRST_NUMBER_MSG)
  num2 = read_number(Constants::SECOND_NUMBER_MSG)
  [num1, num2]
end

def read_number(msg)
  number = format_number(msg)
  convert_str_to_int_or_float(number)
end

def remove_white_space(str)
  str.strip
end

def repeat?
  answer = gets.chomp
  answer.downcase().start_with?('y') ? true : false
end

def valid_number?(number)
  regex = Regexp.new('\A\s*\d+\.?\d*\s*\z')
  regex.match(number)
end

if __FILE__ == $PROGRAM_NAME
  prompt("Hi #{name}")
  loop do # main loop
    number1, number2 = read_in_numbers
    operator = prompt_for_operation
    result = compute_result(operator, number1, \
                            number2, Constants::SECOND_NUMBER_MSG)
    print_result(result)
    break unless repeat?
  end # main loop
  prompt(Constants::GOOD_BYE_MSG)
end
