require_relative './constants'

def monthly_payment(p, j, n)
  p * (j / (1 - (1 + j)**-n))
end

def prompt(msg)
  "=> #{msg}"
end

def welcome_message
  prompt(Constants::WELCOME_MSG)
end
