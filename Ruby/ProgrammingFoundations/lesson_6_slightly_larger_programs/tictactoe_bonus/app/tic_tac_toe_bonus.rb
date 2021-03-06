require_relative './game_view'
require_relative './game_text'
require_relative './game_rules'
require_relative './game_movement'
require_relative './game_tally'

# rubocop:disable Style/MixinUsage
include GameView
include GameText
include GameRules
include GameMovement
include GameTally
# rubocop:enable Style/MixinUsage

SYMBOL_CONVERT = { "X" => GameView::LARGE_X, "O" => GameView::LARGE_O }.freeze

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
  return SYMBOL_CONVERT[symbol] if symbol.eql?("X") || symbol.eql?("O")
  GameView::SPACE
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
    open_squares = GameText.joinor(valid_squares)
    puts GameText.available_squares(open_squares)
    square = gets.chomp.strip
    break if GameMovement.valid_square_selection?(square, valid_squares)
    puts GameText.invalid_square_selection
  end
  square.to_i
end

def play_a_round(board, current_player, player_symbols, tally)
  selected_square = nil
  loop do
    selected_square = select_a_square(board, current_player)
    GameMovement.mark_board_at_square(board, selected_square,
                                      player_symbols[current_player])
    GameView.update_and_present_view(convert_board(board))
    break if GameRules.win_or_tie?(board, selected_square,
                                   player_symbols[current_player])
    current_player = alternate_player(current_player)
  end
  puts GameTally.declare_winner_and_update_tally(board, selected_square,
                                                 player_symbols,
                                                 current_player, tally)
  puts GameText.show_game_tally(tally)
end

def play_the_game(board, current_player, player_symbols, tally)
  loop do
    play_a_round(board, current_player, player_symbols, tally)
    break if GameTally.there_is_a_winner?(tally)
    break if do_not_play_again?
    board = reset_board
    GameView.update_and_present_view(convert_board(board))
  end
end

def reset_board
  Array.new(3) { Array.new(3, GameView::SPACE) }
end

def select_a_square(board, current_player)
  if current_player.eql?("player")
    player_selects_a_square(board)
  else
    unoccupied_squares = GameMovement.collect_unoccupied_squares(board)
    unoccupied_squares.sample
  end
end

def show_game_instructions
  puts GameText.initial_greeting
  puts GameText.game_instructions
  puts GameView.update_view(ALLOWABLE_SQUARE_SELECTIONS) + "\n"
  puts GameText.ask_for_symbol
end

def show_initial_game_state(player_symbols, board)
  system "clear"
  flattened_board = board.flatten

  symbol_assignment_string =
    GameText.declare_assigned_symbols(player_symbols)

  puts symbol_assignment_string + "\n\n"
  puts GameView.update_view(flattened_board)
end

def show_instructions_and_initialize_game(board, player_symbols)
  show_game_instructions
  assign_symbols(player_symbols)
  show_initial_game_state(player_symbols, board)
end

def valid_symbol_entry(symbol)
  symbol.length == 1 && (symbol == "X" || symbol == "O")
end

if $PROGRAM_NAME == __FILE__
  board = Array.new(3) { Array.new(3, GameView::SPACE) }
  player_symbols = { "player" => nil, "computer" => nil }
  tally = { "player" => 0, "computer" => 0 }
  current_player = "player"

  show_instructions_and_initialize_game(board, player_symbols)
  play_the_game(board, current_player, player_symbols, tally)
  puts GameTally.show_final_tally_message(tally)
end
