require 'yaml'

raw_config = File.read('./config.yml')
APP_CONFIG = YAML.load(raw_config)

def invalid_number_msg
  prompt(APP_CONFIG['InvalidNumMsg'])
end

def loan_amt_message
  prompt(APP_CONFIG['LoanAmtMsg'])
end

def monthly_payment(p, j, n)
  p * (j / (1 - (1 + j)**-n))
end

def prompt(msg)
  "=> #{msg}"
end

def valid_number?(number)
  regex = Regexp.new('\A\s*\d+\.?\d*\s*\z')
  regex.match(number)
end

def welcome_message
  prompt(APP_CONFIG['WelcomeMsg'])
end
