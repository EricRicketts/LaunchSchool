require 'yaml'

raw_config = File.read('./config.yml')
APP_CONFIG = YAML.load(raw_config)

def conv_input_to_num(stdin: $stdin, input_type: "loan_amount")
  input = stdin.gets.chomp
  case input_type
  when "loan_amount"
    loan_amount_to_number(input, stdin: $stdin)
  when "interest_rate"
    interest_rate_to_number(input, stdin: $stdin)
  when "loan_duration"
    loan_duration_to_number(input, stdin: $stdin)
  end
end

def interest_rate_to_number(input, stdin: $stdin)
  until valid_interest_rate?(input)
    puts prompt(APP_CONFIG['InvalidInterestMsg'])
    input = stdin.gets.chomp
  end
  input.to_f / 12 / 100
end

def loan_amount_to_number(input, stdin: $stdin)
  until valid_loan_amount?(input)
    puts prompt(APP_CONFIG['InvalidLoanMsg'])
    input = stdin.gets.chomp
  end
  input.delete(",").to_f
end

def loan_duration_to_number(input, stdin: $stdin)
  until valid_loan_duration?(input)
    puts prompt(APP_CONFIG['InvalidLoanDurationMsg'])
    input = stdin.gets.chomp
  end
  input.to_i
end

def calc_payment(p, j, n)
  p * (j / (1 - (1 + j)**-n))
end

def prompt(msg)
  "=> #{msg}"
end

def valid_interest_rate?(interest)
  regex = Regexp.new('\A\s*\d{1,2}(\.\d+)?\s*\z')
  regex.match(interest)
end

def valid_loan_amount?(loan)
  regex = Regexp.new('\A\s*\d{1,3}(,\d{3})*(\.\d+)?\s*\z')
  regex.match(loan)
end

def valid_loan_duration?(months)
  regex = Regexp.new('\A\s*[1-9]\d{0,2}\s*\z')
  regex.match(months)
end

if __FILE__ == $PROGRAM_NAME
  puts prompt(APP_CONFIG['WelcomeMsg'])
  puts prompt(APP_CONFIG['LoanAmtMsg'])
  loan_amount = conv_input_to_num
  puts loan_amount
  puts prompt(APP_CONFIG['InterestAmtMsg'])
  interest = conv_input_to_num(input_type: "interest_rate")
  puts interest
  puts prompt(APP_CONFIG['LoanDurationMsg'])
  loan_duration = conv_input_to_num(input_type: "loan_duration")
  puts loan_duration
  monthly_payment = calc_payment(loan_amount, interest, loan_duration)
  puts prompt(APP_CONFIG['ResultMsg'] + monthly_payment.to_s)
end

