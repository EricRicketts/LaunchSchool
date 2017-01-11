require 'yaml'

module GameText
  raw_config = File.read('./config.yml')
  APP_CONFIG = YAML.load(raw_config)

  def ask_for_another_game
    prompt(APP_CONFIG['AskForAnotherGame'])
  end

  def ask_for_symbol
    prompt(APP_CONFIG['PromptForSymbol'])
  end

  def available_squares(valid_squares)
    prompt("available squares are: " + valid_squares)
  end

  def computer_wins
    "Computer wins!!"
  end

  def computer_wins_game
    APP_CONFIG['FinalMessageComputerWins']
  end

  def declare_assigned_symbols(player_symbols)
    "You are #{player_symbols['player']}, " \
      "the computer is #{player_symbols['computer']}"
  end

  def declare_tie
    "It is a tie!!"
  end

  def game_instructions
    APP_CONFIG['Instructions'] + "\n"
  end

  def initial_greeting
    APP_CONFIG['InitialGreeting'] + "\n"
  end

  def invalid_continue_game_response
    prompt(APP_CONFIG['InvalidContinueGameQuery'])
  end

  def invalid_square_selection
    prompt(APP_CONFIG['InvalidSquareSelection'])
  end

  def invalid_symbol_entry
    prompt(APP_CONFIG['IncorrectSymbolEntry'])
  end

  def no_winner_message
    APP_CONFIG['FinalMessageNoWinner']
  end

  def player_wins
    "You win!!"
  end

  def player_wins_game
    APP_CONFIG['FinalMessagePlayerWins']
  end

  def prompt(message)
    "=> #{message}"
  end

  def show_game_tally(tally)
    "current score: you => #{tally["player"]}, computer => #{tally["computer"]}"
  end

end