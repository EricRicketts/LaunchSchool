require 'yaml'

raw_config = File.read('./config.yml')
APP_CONFIG = YAML.load(raw_config)

def another_loan_calculation?
  repeat = retrieve_first_letter
  until repeat.eql?('y') || repeat.eql?('n')
    puts prompt(APP_CONFIG['InvalidResponseMsg'])
    repeat = retrieve_first_letter
  end
  repeat.eql?('y')
end

def calculate_payment(loan, interest, duration)
  normal_payment = loan * (interest / (1 - (1 + interest)**-duration))
  monthly_payment = interest.zero? ? (loan / duration) : normal_payment
  monthly_payment.round(2)
end

def interest_rate_to_number(input)
  until valid_interest_rate?(input)
    puts prompt(APP_CONFIG['InvalidInterestMsg'])
    input = gets.chomp
  end
  input.to_f / 12 / 100
end

def loan_amount_to_number(input)
  until valid_loan_amount?(input)
    puts prompt(APP_CONFIG['InvalidLoanMsg'])
    input = gets.chomp
  end
  input.to_f
end

def loan_duration_to_number(input)
  until valid_loan_duration?(input) && !input.to_f.zero?
    puts prompt(APP_CONFIG['InvalidLoanDurationMsg'])
    input = gets.chomp
  end
  input.to_f * 12
end

def obtain_interest_amt
  puts prompt(APP_CONFIG['InterestAmtMsg'])
  input = gets.chomp
  interest_rate_to_number(input)
  # convert_input_to_number("interest_rate")
end

def obtain_loan_amt
  puts prompt(APP_CONFIG['LoanAmtMsg'])
  input = gets.chomp
  loan_amount_to_number(input)
  # convert_input_to_number("loan_amount")
end

def obtain_loan_duration
  puts prompt(APP_CONFIG['LoanDurationMsg'])
  input = gets.chomp
  loan_duration_to_number(input)
  # convert_input_to_number("loan_duration")
end

def print_payment(loan, interest, duration)
  monthly_payment = calculate_payment(loan, interest, duration)
  puts prompt(APP_CONFIG['ResultMsg'] + monthly_payment.to_s)
  puts prompt(APP_CONFIG['QuitMsg'])
end

def prompt(msg)
  "=> #{msg}"
end

def retrieve_first_letter
  first_letter = gets.chomp
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
  years_regex = Regexp.new('\A\s*\d+(\.\d+)?\s*\z')
  years_regex.match(years)
end

if __FILE__ == $PROGRAM_NAME
  puts prompt(APP_CONFIG['WelcomeMsg'])
  loop do
    loan = obtain_loan_amt
    interest = obtain_interest_amt
    duration = obtain_loan_duration
    print_payment(loan, interest, duration)
    break unless another_loan_calculation?
  end
  puts prompt(APP_CONFIG['GoodByeMsg'])
end
