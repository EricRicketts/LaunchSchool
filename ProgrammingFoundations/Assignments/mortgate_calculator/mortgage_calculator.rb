require 'yaml'
require 'byebug'

raw_config = File.read('./config.yml')
APP_CONFIG = YAML.load(raw_config)

def calculate_payment(loan, interest, duration)
  normal_payment = loan * (interest / (1 - (1 + interest)**-duration))
  monthly_payment = interest.zero? ? loan / duration : normal_payment
  monthly_payment.round(2)
end

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

def leave_program?(stdin: $stdin)
  repeat = stdin.gets.chomp.strip.downcase.chars.first
  loop do
    break if repeat.eql?('y') || repeat.eql?('n')
    prompt(APP_CONFIG['InvalidResponseMsg'])
    repeat = stdin.gets.chomp.strip.downcase.chars.first
  end
  repeat.eql?('y')
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
  input.to_f * 12
end

def obtain_interest_amt
  puts prompt(APP_CONFIG['InterestAmtMsg'])
  conv_input_to_num(input_type: "interest_rate")
end

def obtain_loan_amt
  puts prompt(APP_CONFIG['LoanAmtMsg'])
  conv_input_to_num
end

def obtain_loan_duration
  puts prompt(APP_CONFIG['LoanDurationMsg'])
  conv_input_to_num(input_type: "loan_duration")
end

def print_payment_and_repeat_or_not(loan, interest, duration)
  monthly_payment = calculate_payment(loan, interest, duration)
  puts prompt(APP_CONFIG['ResultMsg'] + monthly_payment.to_s)
  puts prompt(APP_CONFIG['QuitMsg'])
  leave_program?
end

def prompt(msg)
  "=> #{msg}"
end

def valid_interest_rate?(interest)
  regex = Regexp.new('\A\s*\d{1,2}(\.\d+)?\s*\z')
  regex.match(interest)
end

def valid_loan_amount?(loan)
  regex = Regexp.new('\A\s*\d+(\.\d+)?\s*\z')
  regex.match(loan)
end

def valid_loan_duration?(months)
  regex = Regexp.new('\A\s*[1-9]\d{0,2}\s*\z')
  regex.match(months)
end

if __FILE__ == $PROGRAM_NAME
  puts prompt(APP_CONFIG['WelcomeMsg'])
  continue = true
  while continue
    loan = obtain_loan_amt
    interest = obtain_interest_amt
    duration = obtain_loan_duration
    continue = print_payment_and_repeat_or_not(loan, interest, duration)
  end
  puts prompt(APP_CONFIG['GoodByeMsg'])
end
