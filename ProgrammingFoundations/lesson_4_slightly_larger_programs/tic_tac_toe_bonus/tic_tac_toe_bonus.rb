require 'byebug'
require 'yaml'
require_relative './view'
include View
raw_config = File.read('./config.yml')
APP_CONFIG = YAML.load(raw_config)

ALLOWABLE_SQUARE_SELECTIONS = ("1".."9").to_a.freeze
SYMBOL_CONVERSION = { "X" => View::LARGE_X, "O" => View::LARGE_O }.freeze

def ask_for_symbol_prompt
  prompt(APP_CONFIG['PromptForSymbol'])
end

def assign_symbols
  ask_for_symbol_prompt
  player = obtain_player_symbol
  computer = obtain_computer_symbol(player)
  [player, computer]
end

def collect_unoccupied_squares(board)
  flattened_board = board.flatten
  flattened_board.each_index
                 .select { |index| flattened_board[index].eql?(View::SPACE) }
                 .map { |empty_index| empty_index + 1 }
end

def convert_board(board)
  flattened_board = board.flatten
  flattened_board.map { |symbol| convert_symbol(symbol) }
end

def convert_symbol(symbol)
  return SYMBOL_CONVERSION[symbol] if symbol.eql?("X") || symbol.eql?("O")
  View::SPACE
end

def decrement(num)
  num - 1
end

def show_game_instructions
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

def mark_board_at_square(board, square, symbol)
  row, col = decrement(square).divmod(3)
  board[row][col] = symbol
end

def play_the_game(player, computer, board)
  square = ''
  puts prompt(APP_CONFIG['PlayerMovePrompt'])
  loop do
    valid_squares = collect_unoccupied_squares(board)
    puts prompt("available squares are: " + joinor(valid_squares))
    square = gets.chomp.strip
    break if valid_square_selection?(square, valid_squares)
    puts prompt(APP_CONFIG['InvalidSquareSelection'])
  end
  mark_board_at_square(board, square.to_i, player)
  puts View.update_view(convert_board(board)) + "\n"
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

def prompt(message)
  "=> #{message}"
end

def show_initial_game_state(player, computer, board)
  flattened_board = board.flatten
  puts prompt("You are #{player}, the computer is #{computer}") + "\n\n"
  puts View.update_view(flattened_board)
end

def show_initial_greeting
  prompt(APP_CONFIG['InitialGreeting'])
end

def show_instructions
  prompt(APP_CONFIG['Instructions'])
end

def valid_square_selection?(square, valid_squares)
  ALLOWABLE_SQUARE_SELECTIONS.include?(square) &&
    valid_squares.include?(square.to_i)
end

def valid_symbol_entry(symbol)
  symbol.length == 1 && (symbol == "X" || symbol == "O")
end

if __FILE__ == $PROGRAM_NAME
  board = Array.new(3) { Array.new(3, View::SPACE) }
  show_game_instructions
  player, computer = assign_symbols
  show_initial_game_state(player, computer, board)
  play_the_game(player, computer, board)
end
