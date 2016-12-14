require 'byebug'
require 'yaml'
require_relative './board'
include Board
raw_config = File.read('./config.yml')
APP_CONFIG = YAML.load(raw_config)

SYMBOL_VALUES = { "X" => -1, "O" => 1 }.freeze
DIAGONAL_SQUARES = [0, 4, 8].freeze
DIAGONAL = [[0, 0], [1, 1], [2, 2]].freeze
ANTI_DIAGONAL_SQUARES = [2, 4, 6].freeze
ANTI_DIAGONAL = [[0, 2], [1, 1], [2, 0]].freeze

def ask_for_symbol_prompt
  prompt(APP_CONFIG['PromptForSymbol'])
end

def assign_symbols
  player = obtain_player_symbol
  computer = obtain_computer_symbol(player)
  [player, computer]
end

def decrement(value)
  value - 1
end

def initialize_game
  puts show_initial_greeting + "\n"
  puts show_instructions + "\n"
  puts Board.show_numbered_board + "\n"
  puts ask_for_symbol_prompt
end

def collect_unoccupied_squares(board)
  blank_squares = []
  board.each.with_index do |row, row_index|
    row.each.with_index do |cell, index|
      blank_squares.push(3*row_index + index) if cell.empty?
    end
  end
  blank_squares
end

def make_moves(board, player, computer)
  puts prompt(APP_CONFIG['PlayerMovePrompt'])
  square = gets.chomp.strip.to_i
  mark_board_at_square(board, square, player)
end

def mark_board_at_square(board, square, symbol)
  row, col = decrement(square).divmod(3)
  board[row][col] = symbol
end

def obtain_computer_symbol(player)
  player == "X" ? "O" : "X"
end

def obtain_player_symbol
  player = gets.chomp.strip.upcase
  until valid_symbol_entry(player)
    puts APP_CONFIG['IncorrectSymbolEntry']
    player = gets.chomp.strip.upcase
  end
  player
end

def occupied_square?(board, square)
  row, column = decrement(square).divmod(3)
  !board[row][column].empty?
end

def prompt(message)
  "=> #{message}"
end

def score_anti_diagonal(board, square)
  adjusted_square = decrement(square)
  return 0 unless ANTI_DIAGONAL_SQUARES.include?(adjusted_square)
  anti_diag_values = ANTI_DIAGONAL.map { |cell| board[cell.first][cell.last] }
  anti_diag_values.inject(0) { |sum, index| sum + score_square(index) }
end

def score_current_column(board, square)
  column = decrement(square) % 3
  column_values = board[0..2].map { |row| row[column] }
  column_values.inject(0) { |sum, row| sum + score_square(row) }
end

def score_diagonal(board, square)
  adjusted_square = decrement(square)
  return 0 unless DIAGONAL_SQUARES.include?(adjusted_square)
  diagonal_values = DIAGONAL.map { |cell| board[cell.first][cell.last] }
  diagonal_values.inject(0) { |sum, index| sum + score_square(index) }
end

def score_current_row(board, square)
  row = decrement(square).div(3)
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

def show_symbol_assignment(player, computer)
  prompt("You are #{player}, the computer is #{computer}")
end

def valid_symbol_entry(symbol)
  symbol.length == 1 && (symbol == "X" || symbol == "O")
end

# main program

if __FILE__ == $PROGRAM_NAME
  board = Array.new(3){ Array.new(3, "") }
  initialize_game
  player, computer = assign_symbols
  puts show_symbol_assignment(player, computer)
  puts show_starting_board
  make_moves(board, player, computer)
end
