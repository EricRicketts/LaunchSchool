require 'byebug'
require 'yaml'
require_relative './view'
include View
raw_config = File.read('./config.yml')
APP_CONFIG = YAML.load(raw_config)

ALLOWABLE_SQUARE_SELECTIONS = ("1".."9").to_a.freeze

def ask_for_symbol_prompt
  prompt(APP_CONFIG['PromptForSymbol'])
end

def collect_unoccupied_squares(board)
  flattened_board = board.flatten
  flattened_board.each_index
                 .select { |index| flattened_board[index].eql?(View::SPACE) }
                 .map { |empty_index| empty_index + 1 }
end

def initialize_game
  puts show_initial_greeting + "\n"
  puts show_instructions + "\n"
  puts View.update_view(ALLOWABLE_SQUARE_SELECTIONS) + "\n"
  puts ask_for_symbol_prompt
end

def joinor(squares, delimiter=', ', conjunction='or')
  last_square = squares.last.to_s
  delimiter_included = delimiter + conjunction + View::SPACE + last_square
  delimiter_not_included = View::SPACE + conjunction + View::SPACE + last_square
  end_string = squares.size > 2 ? delimiter_included : delimiter_not_included
  squares.join(delimiter).sub(delimiter + last_square, end_string)
end

def make_a_move(board, player)
  
end

def prompt(message)
  "=> #{message}"
end

def show_initial_greeting
  prompt(APP_CONFIG['InitialGreeting'])
end

def show_instructions
  prompt(APP_CONFIG['Instructions'])
end

def valid_square_selection?(board)
  square = gets.chomp.strip
  integer_square = square.to_i
  ALLOWABLE_SQUARE_SELECTIONS.include?(square) &&
    collect_unoccupied_squares(board).include?(integer_square)
end

if __FILE__ == $PROGRAM_NAME
  initialize_game
end
