require 'yaml'
raw_config = File.read('./config.yml')
APP_CONFIG = YAML.load(raw_config)
OPERATOR_HASH = {
  '1' => 'Adding', '2' => 'Subtracting',
  '3' => 'Multiplying', '4' => 'Dividing'
}

def compute_result(operator, num1, num2)
  case operator
  when '1'
    num1 + num2
  when '2'
    num1 - num2
  when '3'
    num1 * num2
  when '4'
    num1.to_f / num2.to_f
  end
end

def convert_string_to_integer_or_float(str)
  str.to_i == str.to_f ? str.to_i : str.to_f
end

def obtain_name
  prompt(APP_CONFIG['WelcomeMsg'])
  name = ''
  loop do
    name = gets.chomp
    name.empty? || /\s+/ =~ name ? prompt(APP_CONFIG['NameErrorMsg']) : break
  end
  name
end

def obtain_valid_number_string(msg)
  number = ''
  error_msg = APP_CONFIG['NumberErrorMsg']
  loop do
    prompt(msg)
    number = gets.chomp
    valid_number?(number) ? break : prompt(error_msg)
  end
  number.strip
end

def operation_to_message(operator)
  OPERATOR_HASH[operator]
end

def print_result(result, operator)
  prompt("#{operation_to_message(operator)} the two numbers...")
  prompt("The result is #{result}")
  prompt(APP_CONFIG['RepeatCalculationMsg'])
end

def prompt(message)
  puts "=> #{message}"
end

def prompt_for_operation
  prompt(APP_CONFIG['OperatorPrompt'])
  operator = ''
  operator_choice = APP_CONFIG['OperatorChoiceMsg']
  loop do
    operator = gets.chomp
    %w(1 2 3 4).include?(operator) ? break : prompt(operator_choice)
  end
  operator
end

def read_number(msg)
  number_string = obtain_valid_number_string(msg)
  convert_string_to_integer_or_float(number_string)
end

def reassign_divide_by_zero(operator, num2, msg)
  while num2.zero? && operator == '4'
    prompt(APP_CONFIG['DivideByZeroMsg'])
    num2 = read_number(msg)
  end
  num2
end

def repeat?
  repeat = gets.chomp.strip().downcase()
  loop do
    break if repeat.eql?('y') || repeat.eql?('n')
    prompt(APP_CONFIG['IncorrectMsg'])
    repeat = gets.chomp.strip().downcase()
  end
  repeat.eql?('y')
end

def valid_number?(number)
  regex = Regexp.new('\A\s*[-+]?\d+\.?\d*\s*\z')
  regex.match(number)
end

if __FILE__ == $PROGRAM_NAME
  user_name = obtain_name
  prompt("Hi #{user_name}")
  loop do # main loop
    number1 = read_number(APP_CONFIG['FirstNumberMsg'])
    number2 = read_number(APP_CONFIG['SecondNumberMsg'])
    operator = prompt_for_operation
    if number2.zero? && operator == '4'
      msg = APP_CONFIG['SecondNumberMsg']
      number2 = reassign_divide_by_zero(operator, number2, msg)
    end
    result = compute_result(operator, number1, number2)
    print_result(result, operator)
    break unless repeat?
  end # main loop
  prompt(APP_CONFIG['GoodByeMsg'])
end
