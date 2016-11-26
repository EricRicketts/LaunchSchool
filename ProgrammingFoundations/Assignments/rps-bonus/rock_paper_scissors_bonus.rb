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

VALID_ENTRIES = %w(r p l sc sp)
VALID_GAME_OBJECTS = %w(rock paper scissors lizard spock)
CHOICE_MAPPINGS = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

# create an Array method to better name operation
# on game objects in #win?
class Array
  def beats?(element)
    include?(element)
  end
end

def display_current_scores(game_score_hash)
  prompt("your score: #{game_score_hash[:player_score]} " \
    "computer score: #{game_score_hash[:computer_score]}")
end

def display_game_winner(game_score_hash)
  player_score = game_score_hash[:player_score]
  winner_text =
    player_score == 5 ? "You win the game!!" : "The computer wins the game!!"
  prompt(winner_text)
end

def display_selections(player_choice, computer_choice)
  prompt("your choice: #{player_choice}\n" +
    prompt("computer choice: #{computer_choice}"))
end

def display_turn_results(user_choice, computer_choice, game_score_hash)
  puts display_selections(user_choice, computer_choice)
  puts win?(user_choice, computer_choice, game_score_hash)
  puts display_current_scores(game_score_hash)
end

def game_over?(game_score_hash)
  game_score_hash[:player_score] == 5 || game_score_hash[:computer_score] == 5
end

def player_choice
  choice = ''
  loop do
    puts prompt(APP_CONFIG['ChoiceMsg'])
    choice = gets.chomp.strip.downcase
    break if VALID_ENTRIES.include?(choice)
    puts prompt(APP_CONFIG['InvalidResponseMsg'])
  end
  CHOICE_MAPPINGS[choice]
end

def prompt(message)
  "=> #{message}"
end

def win?(first, second, game_score_hash)
  if WINNING_RELATIONSHIPS[first].beats?(second)
    game_score_hash[:player_score] += 1
    prompt(APP_CONFIG['PlayerWinsMsg'])
  elsif WINNING_RELATIONSHIPS[second].beats?(first)
    game_score_hash[:computer_score] += 1
    prompt(APP_CONFIG['ComputerWinsMsg'])
  else
    prompt(APP_CONFIG['TieMsg'])
  end
end

if __FILE__ == $PROGRAM_NAME
  game_score_hash = { player_score: 0, computer_score: 0 }
  puts prompt(APP_CONFIG['GreetingMsg'])

  until game_over?(game_score_hash)
    user_choice = player_choice
    computer_choice = VALID_GAME_OBJECTS.sample
    display_turn_results(user_choice, computer_choice, game_score_hash)
  end

  puts display_game_winner(game_score_hash)
  puts prompt(APP_CONFIG['GoodbyeMsg'])
end
