require 'byebug'
require 'yaml'
require_relative './view'
include View
raw_config = File.read('./config.yml')
APP_CONFIG = YAML.load(raw_config)

ALLOWABLE_SQUARE_SELECTIONS = ("1".."9").to_a.freeze
SYMBOL_CONVERSION = { "X" => View::LARGE_X, "O" => View::LARGE_O }.freeze

def alternate_player(current_player)
  current_player == "computer" ? "player" : "computer"
end

def ask_for_symbol_prompt
  prompt(APP_CONFIG['PromptForSymbol'])
end

def assign_symbols(player_symbols)
  ask_for_symbol_prompt
  player_symbols["player"] = obtain_player_symbol
  player_symbols["computer"] = obtain_computer_symbol(player_symbols["player"])
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

def detect_anti_diagonal_winner(board, selected_square, player)
  row_size = board.first.size
  anti_diagonal_square_numbers = generate_anti_diagonal_square_numbers(board)
  return nil unless anti_diagonal_square_numbers.include?(selected_square)

  winner = generate_and_check_either_diagonal(anti_diagonal_square_numbers,
                                              board, row_size, player)
  winner ? player : nil
end

def detect_column_winner(board, selected_square, player)
  transposed_board = board.transpose
  detect_row_winner(transposed_board, selected_square, player)
end

def detect_diagonal_winner(board, selected_square, player)
  row_size = board.first.size
  diagonal_square_numbers = generate_diagonal_square_numbers(board)
  return nil unless diagonal_square_numbers.include?(selected_square)

  winner = generate_and_check_either_diagonal(diagonal_square_numbers,
                                              board, row_size, player)
  winner ? player : nil
end

def detect_row_winner(board, selected_square, player)
  row_size = board.first.size
  row = decrement(selected_square).div(row_size)
  winner = board[row].all? { |square| square.eql?(player) }
  winner ? player : nil
end

def generate_and_check_either_diagonal(square_numbers, board, row_size, player)
  decremented_square_numbers =
    square_numbers.map { |square_number| decrement(square_number) }
  either_diagonal_squares =
    decremented_square_numbers.map { |square| square.divmod(row_size) }
  either_diagonal_squares.all? do |square|
    board[square.first][square.last].eql?(player)
  end
end

def generate_anti_diagonal_square_numbers(board)
  row_size = board.first.size
  (2..row_size).to_a.inject([row_size]) do |anti_diagonal_numbers|
    anti_diagonal_numbers << anti_diagonal_numbers.last + row_size - 1
  end
end

def generate_diagonal_square_numbers(board)
  row_size = board.first.size
  (2..row_size).to_a.inject([1]) do |diagonal_numbers|
    diagonal_numbers << diagonal_numbers.last + row_size + 1
  end
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

def play_the_game(player_symbols, current_player, board)
  loop do
    selected_square = select_a_square(board, current_player)
    mark_board_at_square(board, current_player)
    puts View.update_view(convert_board(board)) + "\n"
  end
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

def player_selects_a_square(board)
  square = ''
  loop do
    valid_squares = collect_unoccupied_squares(board)
    puts prompt("available squares are: " + joinor(valid_squares))
    square = gets.chomp.strip
    break if valid_square_selection?(square, valid_squares)
    puts prompt(APP_CONFIG['InvalidSquareSelection'])
  end
  square.to_i
end

def prompt(message)
  "=> #{message}"
end

def select_a_square(board, current_player)
  if current_player.eql?("player")
    player_selects_a_square(board)
  else
    unoccupied_squares = collect_unoccupied_squares(board)
    unoccupied_squares.sample
  end
end

def show_game_instructions
  puts APP_CONFIG['InitialGreeting'] + "\n"
  puts APP_CONFIG['Instructions'] + "\n"
  puts View.update_view(ALLOWABLE_SQUARE_SELECTIONS) + "\n"
  puts ask_for_symbol_prompt
end

def show_initial_game_state(player_symbols, board)
  system "clear"
  flattened_board = board.flatten
  symbol_assignment_string = "You are #{player_symbols['player']}, " \
  "the computer is #{player_symbols['computer']}"

  puts symbol_assignment_string + "\n\n"
  puts View.update_view(flattened_board)
end

def tie?(board)
  flattened_board = board.flatten
  flattened_board.none? { |square| square.eql?(View::SPACE) }
end

def valid_square_selection?(square, valid_squares)
  ALLOWABLE_SQUARE_SELECTIONS.include?(square) &&
    valid_squares.include?(square.to_i)
end

def valid_symbol_entry(symbol)
  symbol.length == 1 && (symbol == "X" || symbol == "O")
end

def winner_or_tie?(board, selected_square, player)
  !!detect_row_winner(board, selected_square, player) ||
    !!detect_column_winner(board, selected_square, player) ||
    !!detect_diagonal_winner(board, selected_square, player) ||
    !!detect_anti_diagonal_winner(board, selected_square, player) ||
    tie?(board)
end

if __FILE__ == $PROGRAM_NAME
  board = Array.new(3) { Array.new(3, View::SPACE) }
  player_symbols = { "player" => nil, "computer" => nil }

  show_game_instructions
  assign_symbols(player_symbols)
  current_player = "player"
  show_initial_game_state(player_symbols, board)

  play_the_game(player_symbols, current_player, board)
end