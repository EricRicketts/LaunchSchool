def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  regex = Regexp.new('^\s*\d+\.*\d*\s*$')
  regex.match(number)
end

def remove_white_space(str)
  str.strip!
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
    number = remove_white_space(gets.chomp)
    valid_number?(number) ? break : prompt(error_msg)
  end
  number
end

first_number_msg = "What's the first number?"
second_number_msg = "What's the second number?"
prompt("Hi #{name}")
number1 = format_number(first_number_msg)
number2 = format_number(second_number_msg)
