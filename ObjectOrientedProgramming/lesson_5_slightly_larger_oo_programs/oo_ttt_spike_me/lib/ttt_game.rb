require_relative './game_view'

class TTTGame
  include GameView

  def play
    display_welcome_message
    loop do
      diplay_board
      first_player_moves
      break if someone_won? || board_full?

      second_player_moves
      break if someone_won? || board_full?
    end
    display_result
    display_goodbye_message
  end
end