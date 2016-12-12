require 'yaml'
require_relative './board'
include Board
raw_config = File.read('./config.yml')
APP_CONFIG = YAML.load(raw_config)

SYMBOL_VALUES = { "X" => -1, "O" => 1 }.freeze

def ask_for_symbol_prompt
  prompt(APP_CONFIG['PromptForSymbol'])
end

def initialize_game
  puts show_initial_greeting + "\n"
  puts show_instructions + "\n"
  puts Board.show_numbered_board + "\n"
  puts ask_for_symbol_prompt
end

def mark_board_at_square(board, square, symbol)
  row, col = (square - 1).divmod(3)
  board[row][col] = symbol
end

def prompt(message)
  "=> #{message}"
end

def score_current_column(board, square)
  column = (square - 1) % 3
  column_values = board[0..2].map { |row| row[column] }
  column_values.inject(0) { |sum, row| sum + score_square(row) }
end

def score_current_row(board, square)
  row = (square - 1).div(3)
  board[row].inject(0) { |sum, col| sum + score_square(col) }
end

def score_square(square)
  square.empty? ? 0 : SYMBOL_VALUES[square]
end

def show_initial_greeting
  prompt(APP_CONFIG['InitialGreeting'])
end

def show_instructions
  prompt(APP_CONFIG['Instructions'])
end

# main program

if +__FILE__ == $PROGRAM_NAME
  initialize_game
end
