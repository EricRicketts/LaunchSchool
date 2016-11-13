require 'yaml'

raw_config = File.read('./config.yml')
APP_CONFIG = YAML.load(raw_config)

def convert_input_to_float(stdin: $stdin)
  input = stdin.gets.chomp
  until valid_loan?(input)
    puts prompt(APP_CONFIG['InvalidNumMsg'])
    input = stdin.gets.chomp
  end
  input.delete(",").to_f
end

def monthly_payment(p, j, n)
  p * (j / (1 - (1 + j)**-n))
end

def prompt(msg)
  "=> #{msg}"
end

def valid_loan?(number)
  regex = Regexp.new('\A\s*\d{1,3}(,\d{3})*(\.\d+)?\s*\z')
  regex.match(number)
end

if __FILE__ == $PROGRAM_NAME
  puts prompt(APP_CONFIG['WelcomeMsg'])
  puts prompt(APP_CONFIG['LoanAmtMsg'])
  loan_amount = convert_input_to_float
  puts loan_amount
end

