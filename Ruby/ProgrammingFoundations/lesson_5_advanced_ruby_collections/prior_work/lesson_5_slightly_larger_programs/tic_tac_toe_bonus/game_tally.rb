require_relative './game_rules'
require_relative './game_text'

module GameTally
  include GameRules
  include GameText

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

  def show_final_tally_message(tally)
    if tally["player"] == 5
      GameText.player_wins_game
    elsif tally["computer"] == 5
      GameText.computer_wins_game
    else
      GameText.no_winner_message
    end
  end

  def there_is_a_winner?(tally)
    tally["player"] == 5 || tally["computer"] == 5
  end

  def winner_string_and_tally_update(possible_winning_plays,
                                     player_symbols, tally)
    winning_symbol = possible_winning_plays.compact.first
    winner = player_symbols.key(winning_symbol)
    tally[winner] += 1
    winner.eql?("player") ? GameText.player_wins : GameText.computer_wins
  end

end # GameTally