require 'byebug'
def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  regex = Regexp.new('\A\s*\d+\.*\d*\s*\z')
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
  error_msg = "Hmm... that doesn't look like a valid number"
  loop do
    prompt(msg)
    number = gets.chomp
    valid_number?(number) ? break : prompt(error_msg)
  end
  number = remove_white_space(number)
end

def operation_to_message(operator)
  case operator
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

def read_and_format_number(msg)
  number = format_number(msg)
  convert_str_to_int_or_float(number)
end

first_number_msg = "What's the first number?"
second_number_msg = "What's the second number?"
operator_prompt = <<-MSG
  What operation would you like to perform?
  1) Add
  2) Subtract
  3) Multiply
  4) Divide
MSG

prompt("Hi #{name}")

loop do # main loop
  # number1 = format_number(first_number_msg)
  # number1 = convert_str_to_int_or_float(number1)
  number1 = read_and_format_number(first_number_msg)
  number2 = format_number(second_number_msg)
  number2 = convert_str_to_int_or_float(number2)
  prompt(operator_prompt)
  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")
    result = case operator
             when '1'
               number1 + number2
             when '2'
               number1 - number2
             when '3'
               number1 * number2
             when '4'
               number1 / number2
             end

  prompt("The result is #{result}")
  prompt("Do you want to perform another calculation?  (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end # main loop

prompt("Thank you for using the calculator.  Good bye!")
