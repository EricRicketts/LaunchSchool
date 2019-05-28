require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'pry-byebug'

HIGH_NUMBER = 3

configure do
  enable :sessions
  set :erb, :escape_html => true
end

helpers do

  def add_to_balance(bet)
    session[:message] = "You have guessed correctly"
    session[:balance] += bet
  end

  def balance
    session[:balance]
  end

  def balance_nil?
    session[:balance].nil?
  end

  def illegal_bet?(bet)
    bet < 1 || bet > session[:balance]
  end

  def broke?
    session[:balance] <= 0
  end

  def correct_guess?(guess, actual)
    guess == actual
  end

  def set_balance
    session[:balance] = (balance_nil? || broke?) ? 100 : session[:balance]
  end

  def subtract_from_balance(bet, guess, actual)
    session[:message] = "You guessed #{guess}, but the number was #{actual}."
    session[:balance] -= bet
  end

  def target_number
    rand(HIGH_NUMBER) + 1
  end
end

get "/" do
  set_balance
  erb :bet
end

get "/broke" do
  session[:message] = "You have lost all of your money."
  erb :broke
end

post "/bet" do
  actual = target_number
  guess = params[:guess].to_i
  bet = params[:bet].to_i

  if illegal_bet?(bet)
    session[:message] = "Bet must be between $1 or #{balance}"
    redirect "/"
  else
    correct_guess?(guess, actual) ? add_to_balance(bet) : subtract_from_balance(bet, guess, actual)
    broke? ? redirect("/broke") : redirect("/")
  end

end
