require 'byebug'
require 'yaml'
require_relative './view'
require_relative './game_prompts'
include View
include GamePrompts
raw_config = File.read('./config.yml')
APP_CONFIG = YAML.load(raw_config)

ALLOWABLE_SQUARE_SELECTIONS = ("1".."9").to_a.freeze
SYMBOL_CONVERSION = { "X" => View::LARGE_X, "O" => View::LARGE_O }.freeze

def alternate_player(current_player)
  current_player == "computer" ? "player" : "computer"
end

def assign_symbols(player_symbols)
  GamePrompts.ask_for_symbol
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

def declare_winner_and_update_tally(board, selected_square,
                                    player_symbols, current_player, tally)
  possible_winning_plays = [
    detect_row_winner(board, selected_square, player_symbols[current_player]),
    detect_column_winner(board, selected_square,
                         player_symbols[current_player]),
    detect_diagonal_winner(board, selected_square,
                           player_symbols[current_player]),
    detect_anti_diagonal_winner(board, selected_square,
                                player_symbols[current_player])
  ]
  increment_tally_and_output_winner_string(possible_winning_plays,
                                           player_symbols, tally)
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
  column = decrement(selected_square) % 3
  column_values = board[0..2].map { |row| row[column] }
  winner = column_values.all? { |square| square.eql?(player) }
  winner ? player : nil
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

def do_not_play_again?
  puts GamePrompts.ask_for_another_game
  answer = gets.chomp.strip.upcase
  unless answer.eql?("Y") || answer.eql?("N")
    puts GamePrompts.invalid_continue_game_response
    answer = gets.chomp.strip.upcase
  end
  answer.eql?("N")
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

def increment_tally_and_output_winner_string(possible_winning_plays,
                                             player_symbols, tally)
  tie = possible_winning_plays.all?(&:nil?)

  if tie
    "It is a tie!!"
  else
    winner_string_and_tally_update(possible_winning_plays,
                                   player_symbols, tally)
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

def obtain_computer_symbol(player)
  player == "X" ? "O" : "X"
end

def obtain_player_symbol
  player = gets.chomp.strip.upcase
  until valid_symbol_entry(player)
    puts GamePrompts.invalid_symbol_entry
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
    puts GamePrompts.invalid_square_selection
  end
  square.to_i
end

def play_a_single_game(board, current_player, player_symbols, tally)
  selected_square = nil
  loop do
    selected_square = select_a_square(board, current_player)
    mark_board_at_square(board, selected_square, player_symbols[current_player])
    update_and_present_view(convert_board(board))
    break if win_or_tie?(board, selected_square, player_symbols[current_player])
    current_player = alternate_player(current_player)
  end
  puts declare_winner_and_update_tally(board, selected_square,
                                       player_symbols, current_player, tally)
  puts show_game_tally(tally)
end

def play_the_game(board, current_player, player_symbols, tally)
  loop do
    play_a_single_game(board, current_player, player_symbols, tally)
    break if there_is_a_winner?(tally)
    break if do_not_play_again?
    board = reset_board
    update_and_present_view(convert_board(board))
  end
end

def prompt(message)
  "=> #{message}"
end

def reset_board
  Array.new(3) { Array.new(3, View::SPACE) }
end

def select_a_square(board, current_player)
  if current_player.eql?("player")
    player_selects_a_square(board)
  else
    unoccupied_squares = collect_unoccupied_squares(board)
    unoccupied_squares.sample
  end
end

def show_final_tally_message(tally)
  if tally["player"] == 5
    GamePrompts.player_wins_message
  elsif tally["computer"] == 5
    GamePrompts.computer_wins_message
  else
    GamePrompts.no_winner_message
  end
end

def show_game_instructions
  puts GamePrompts.initial_greeting
  puts GamePrompts.game_instructions
  puts View.update_view(ALLOWABLE_SQUARE_SELECTIONS) + "\n"
  puts GamePrompts.ask_for_symbol
end

def show_game_tally(tally)
  "current score: you => #{tally["player"]}, computer => #{tally["computer"]}"
end

def show_initial_game_state(player_symbols, board)
  system "clear"
  flattened_board = board.flatten
  symbol_assignment_string = "You are #{player_symbols['player']}, " \
  "the computer is #{player_symbols['computer']}"

  puts symbol_assignment_string + "\n\n"
  puts View.update_view(flattened_board)
end

def show_instructions_and_initialize_game(board, player_symbols)
  show_game_instructions
  assign_symbols(player_symbols)
  show_initial_game_state(player_symbols, board)
end

def there_is_a_winner?(tally)
  tally["player"] == 5 || tally["computer"] == 5
end

def tie?(board)
  flattened_board = board.flatten
  flattened_board.none? { |square| square.eql?(View::SPACE) }
end

def update_and_present_view(board)
  system "clear"
  puts View.update_view(board)
end

def valid_square_selection?(square, valid_squares)
  ALLOWABLE_SQUARE_SELECTIONS.include?(square) &&
    valid_squares.include?(square.to_i)
end

def valid_symbol_entry(symbol)
  symbol.length == 1 && (symbol == "X" || symbol == "O")
end

def win_or_tie?(board, selected_square, player)
  !!detect_row_winner(board, selected_square, player) ||
    !!detect_column_winner(board, selected_square, player) ||
    !!detect_diagonal_winner(board, selected_square, player) ||
    !!detect_anti_diagonal_winner(board, selected_square, player) ||
    tie?(board)
end

def winner_string_and_tally_update(possible_winning_plays,
                                   player_symbols, tally)
  winning_symbol = possible_winning_plays.compact.first
  winner = player_symbols.key(winning_symbol)
  tally[winner] += 1
  winner.eql?("player") ? "You win!!" : "Computer wins!!"
end

if __FILE__ == $PROGRAM_NAME
  board = Array.new(3) { Array.new(3, View::SPACE) }
  player_symbols = { "player" => nil, "computer" => nil }
  tally = { "player" => 0, "computer" => 0 }
  current_player = "player"

  show_instructions_and_initialize_game(board, player_symbols)
  play_the_game(board, current_player, player_symbols, tally)
  puts show_final_tally_message(tally)
end
