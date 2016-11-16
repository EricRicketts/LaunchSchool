require 'yaml'
raw_config = File.read('./config.yml')
APP_CONFIG = YAML.load(raw_config)
OPERATOR_HASH = {
  '1' => 'Adding', '2' => 'Subtracting',
  '3' => 'Multiplying', '4' => 'Dividing'
}

def compute_result(operator, num1, num2)
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
  error_msg = APP_CONFIG['NumberErrorMsg']
  loop do
    prompt(msg)
    number = gets.chomp
    valid_number?(number) ? break : prompt(error_msg)
  end
  number.strip
end

def name
  prompt(APP_CONFIG['WelcomeMsg'])
  name = ''
  loop do
    name = gets.chomp
    name.empty? || /\s+/ =~ name ? prompt(APP_CONFIG['NameErrorMsg']) : break
  end
  name
end

def operation_to_message(operator)
  OPERATOR_HASH[operator]
end

def print_result(result)
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
  number = format_number(msg)
  convert_str_to_int_or_float(number)
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
  prompt("Hi #{name}")
  loop do # main loop
    number1 = read_number(APP_CONFIG['FirstNumberMsg'])
    number2 = read_number(APP_CONFIG['SecondNumberMsg'])
    operator = prompt_for_operation
    if number2.zero? && operator == '4'
      msg = APP_CONFIG['SecondNumberMsg']
      number2 = reassign_divide_by_zero(operator, number2, msg)
    end
    result = compute_result(operator, number1, number2)
    print_result(result)
    break unless repeat?
  end # main loop
  prompt(APP_CONFIG['GoodByeMsg'])
end
