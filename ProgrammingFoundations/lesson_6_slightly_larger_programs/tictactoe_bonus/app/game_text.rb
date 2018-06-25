require 'yaml'

require_relative './game_view'

module GameText
  include GameView

  HOME_DIR = Dir.home
  LS_DIR = '/Documents/LaunchSchool'
  COURSE_DIR = '/ProgrammingFoundations'
  LESSON_DIR = '/lesson_6_slightly_larger_programs/tictactoe_bonus'
  WORKING_DIRECTORY = HOME_DIR + LS_DIR + COURSE_DIR + LESSON_DIR

  raw_config = File.read(WORKING_DIRECTORY + '/app/config.yml')
  APP_CONFIG = YAML.safe_load(raw_config)

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

  def joinor(squares, delimiter=', ', conjunction='or')
    last_square = squares.last.to_s
    delimiter_included = delimiter + conjunction + GameView::SPACE + last_square
    not_included = GameView::SPACE + conjunction + GameView::SPACE + last_square
    end_string = squares.size > 2 ? delimiter_included : not_included
    squares.join(delimiter).sub(delimiter + last_square, end_string)
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
    "current score: you => #{tally['player']}, computer => #{tally['computer']}"
  end
end
