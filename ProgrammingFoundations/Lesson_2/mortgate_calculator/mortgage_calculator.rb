require 'yaml'

raw_config = File.read('./config.yml')
APP_CONFIG = YAML.load(raw_config)

def convert_input_to_number(stdin: $stdin, input_type: "loan")
  input = stdin.gets.chomp
  case input_type
  when "loan"
    loan_to_number(input, stdin: $stdin)
  when "interest"
    interest_rate_to_number(input, stdin: $stdin)
  end
end

def interest_rate_to_number(input, stdin: $stdin)
  until valid_interest?(input)
    puts prompt(APP_CONFIG['InvalidInterestMsg'])
    input = stdin.gets.chomp
  end
  input.to_f / 12 / 100
end

def loan_to_number(input, stdin: $stdin)
  until valid_loan?(input)
    puts prompt(APP_CONFIG['InvalidLoanMsg'])
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

def valid_interest?(interest)
  regex = Regexp.new('\A\s*\d{1,2}(\.\d+)?\s*\z')
  regex.match(interest)
end

def valid_loan?(loan)
  regex = Regexp.new('\A\s*\d{1,3}(,\d{3})*(\.\d+)?\s*\z')
  regex.match(loan)
end

def valid_loan_duration?(months)
  regex = Regexp.new('\A\s*\d{1,3}\s*\z')
  regex.match(months)
end

if __FILE__ == $PROGRAM_NAME
  puts prompt(APP_CONFIG['WelcomeMsg'])
  puts prompt(APP_CONFIG['LoanAmtMsg'])
  loan_amount = convert_input_to_number
  puts loan_amount
  puts prompt(APP_CONFIG['InterestAmtMsg'])
  interest = convert_input_to_number(input_type: "interest")
  puts interest
end

