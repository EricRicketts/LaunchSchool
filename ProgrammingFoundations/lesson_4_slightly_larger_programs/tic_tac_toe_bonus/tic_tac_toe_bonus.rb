require 'byebug'
require 'yaml'
require_relative './view'
require_relative './game_text'
require_relative './game_rules'
require_relative './game_movement'
include View
include GameText
include GameRules
include GameMovement

SYMBOL_CONVERSION = { "X" => View::LARGE_X, "O" => View::LARGE_O }.freeze

def alternate_player(current_player)
  current_player == "computer" ? "player" : "computer"
end

def assign_symbols(player_symbols)
  GameText.ask_for_symbol
  player_symbols["player"] = obtain_player_symbol
  player_symbols["computer"] = obtain_computer_symbol(player_symbols["player"])
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
    GameRules.detect_row_winner(
      board, selected_square, player_symbols[current_player]),
    GameRules.detect_column_winner(board, selected_square,
                                   player_symbols[current_player]),
    GameRules.detect_diagonal_winner(board, selected_square,
                                     player_symbols[current_player]),
    GameRules.detect_anti_diagonal_winner(board, selected_square,
                                          player_symbols[current_player])
  ]
  increment_tally_and_output_winner_string(possible_winning_plays,
                                           player_symbols, tally)
end

def do_not_play_again?
  puts GameText.ask_for_another_game
  answer = gets.chomp.strip.upcase
  unless answer.eql?("Y") || answer.eql?("N")
    puts GameText.invalid_continue_game_response
    answer = gets.chomp.strip.upcase
  end
  answer.eql?("N")
end

def increment_tally_and_output_winner_string(possible_winning_plays,
                                             player_symbols, tally)
  tie = possible_winning_plays.all?(&:nil?)

  if tie
    GameText.declare_tie
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
    puts GameText.invalid_symbol_entry
    player = gets.chomp.strip.upcase
  end
  player
end

def player_selects_a_square(board)
  square = ''
  loop do
    valid_squares = GameMovement.collect_unoccupied_squares(board)
    puts GameText.available_squares(joinor(valid_squares))
    square = gets.chomp.strip
    break if GameMovement.valid_square_selection?(square, valid_squares)
    puts GameText.invalid_square_selection
  end
  square.to_i
end

def play_a_single_game(board, current_player, player_symbols, tally)
  selected_square = nil
  loop do
    selected_square = select_a_square(board, current_player)
    mark_board_at_square(board, selected_square,
                         player_symbols[current_player])
    View.update_and_present_view(convert_board(board))
    break if GameRules.win_or_tie?(board, selected_square,
                                   player_symbols[current_player])
    current_player = alternate_player(current_player)
  end
  puts declare_winner_and_update_tally(board, selected_square,
                                       player_symbols, current_player, tally)
  puts GameText.show_game_tally(tally)
end

def play_the_game(board, current_player, player_symbols, tally)
  loop do
    play_a_single_game(board, current_player, player_symbols, tally)
    break if there_is_a_winner?(tally)
    break if do_not_play_again?
    board = reset_board
    View.update_and_present_view(convert_board(board))
  end
end

def reset_board
  Array.new(3) { Array.new(3, View::SPACE) }
end

def select_a_square(board, current_player)
  if current_player.eql?("player")
    player_selects_a_square(board)
  else
    unoccupied_squares = GameMovement.collect_unoccupied_squares(board)
    unoccupied_squares.sample
  end
end

def show_final_tally_message(tally)
  if tally["player"] == 5
    GameText.player_wins_game
  elsif tally["computer"] == 5
    GameText.computer_wins_game
  else
    GameText.no_winner_message
  end
end

def show_game_instructions
  puts GameText.initial_greeting
  puts GameText.game_instructions
  puts View.update_view(ALLOWABLE_SQUARE_SELECTIONS) + "\n"
  puts GameText.ask_for_symbol
end

def show_initial_game_state(player_symbols, board)
  system "clear"
  flattened_board = board.flatten

  symbol_assignment_string =
    GameText.declare_assigned_symbols(player_symbols)

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

def valid_symbol_entry(symbol)
  symbol.length == 1 && (symbol == "X" || symbol == "O")
end

def winner_string_and_tally_update(possible_winning_plays,
                                   player_symbols, tally)
  winning_symbol = possible_winning_plays.compact.first
  winner = player_symbols.key(winning_symbol)
  tally[winner] += 1
  winner.eql?("player") ? GameText.player_wins : GameText.computer_wins
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
