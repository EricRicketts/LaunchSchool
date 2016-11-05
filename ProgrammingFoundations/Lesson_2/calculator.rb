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

prompt("Hi #{name}")

number1 = ''
loop do
  prompt("What's the first number?")
  number1 = gets.chomp

  if valid_number?(number1)
    break
  else
    prompt("Hmm... that doesn't look like a valid number")
  end
end
