require 'yaml'
require 'byebug'

raw_config = File.read('./config.yml')
APP_CONFIG = YAML.load(raw_config)

def calculate_payment(loan, interest, duration)
  normal_payment = loan * (interest / (1 - (1 + interest)**-duration))
  monthly_payment = interest.zero? ? loan / duration : normal_payment
  monthly_payment.round(2)
end

def convert_input_to_number(input_type)
  input = gets.chomp
  case input_type
  when "loan_amount"
    loan_amount_to_number(input)
  when "interest_rate"
    interest_rate_to_number(input)
  when "loan_duration"
    loan_duration_to_number(input)
  end
end

def interest_rate_to_number(input)
  until valid_interest_rate?(input)
    puts prompt(APP_CONFIG['InvalidInterestMsg'])
    input = gets.chomp
  end
  input.to_f / 12 / 100
end

def leave_program?(stdin: $stdin)
  repeat = retrieve_first_letter(stdin: stdin)
  until repeat.eql?('y') || repeat.eql?('n')
    prompt(APP_CONFIG['InvalidResponseMsg'])
    repeat = retrieve_first_letter(stdin: stdin)
  end
  repeat.eql?('y')
end

def loan_amount_to_number(input)
  until valid_loan_amount?(input)
    puts prompt(APP_CONFIG['InvalidLoanMsg'])
    input = gets.chomp
  end
  input.to_f
end

def loan_duration_to_number(input)
  until valid_loan_duration?(input)
    puts prompt(APP_CONFIG['InvalidLoanDurationMsg'])
    input = gets.chomp
  end
  input.to_f * 12
end

def obtain_interest_amt
  puts prompt(APP_CONFIG['InterestAmtMsg'])
  convert_input_to_number(input_type: "interest_rate")
end

def obtain_loan_amt
  puts prompt(APP_CONFIG['LoanAmtMsg'])
  convert_input_to_number(input_type: "loan_amount")
end

def obtain_loan_duration
  puts prompt(APP_CONFIG['LoanDurationMsg'])
  convert_input_to_number(input_type: "loan_duration")
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

def retrieve_first_letter(stdin: $stdin)
  first_letter = stdin.gets.chomp
  first_letter.strip.downcase.chars.first
end

def valid_interest_rate?(interest)
  interest_regex = Regexp.new('\A\s*\d{1,2}(\.\d+)?\s*\z')
  interest_regex.match(interest)
end

def valid_loan_amount?(loan)
  loan_amount_regex = Regexp.new('\A\s*\d+(\.\d+)?\s*\z')
  loan_amount_regex.match(loan)
end

def valid_loan_duration?(years)
  years_regex = Regexp.new('\A\s*[1-9]\d{0,2}\s*\z')
  years_regex.match(years)
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
