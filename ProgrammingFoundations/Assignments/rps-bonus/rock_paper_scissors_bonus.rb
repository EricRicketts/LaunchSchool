require 'byebug'
require 'yaml'

raw_config = File.read('./config.yml')
APP_CONFIG = YAML.load(raw_config)

ROCK_WINS_AGAINST = %w(lizard scissors)
PAPER_WINS_AGAINST = %w(rock spock)
SCISSORS_WINS_AGAINST = %w(lizard paper)
LIZARD_WINS_AGAINST = %w(paper spock)
SPOCK_WINS_AGAINST = %w(rock scissors)

WINNING_RELATIONSHIPS = {
  'rock' => ROCK_WINS_AGAINST,
  'paper' => PAPER_WINS_AGAINST,
  'scissors' => SCISSORS_WINS_AGAINST,
  'lizard' => LIZARD_WINS_AGAINST,
  'spock' => SPOCK_WINS_AGAINST
}

VALID_SINGLE_LETTERS = %w(r p l)
VALID_TWO_LETTERS = %w(sc sp)

# create an Array method to better name operation
# on game objects in #win?
class Array
  def beats?(element)
    include?(element)
  end
end

def player_choice
  prompt(APP_CONFIG['ChoiceMsg'])
  loop do
    choice = gets.chomp
    break if valid_user_response?(choice)
  end
end

def prompt(message)
  "=> #{message}"
end

def valid_user_response?(choice)
  response_one_letter = choice.strip.downcase.chars.first
  response_two_letters = choice.strip.downcase.chars.slice(0, 2).join
  VALID_SINGLE_LETTERS.include?(response_one_letter) ||
    VALID_TWO_LETTERS.include?(response_two_letters)
end

def win?(first, second)
  WINNING_RELATIONSHIPS[first].beats?(second)
end

if __FILE__ == $PROGRAM_NAME
  choice = ''
  prompt(APP_CONFIG['GreetingMsg'])

  loop do
    choice = player_choice
  end
end
