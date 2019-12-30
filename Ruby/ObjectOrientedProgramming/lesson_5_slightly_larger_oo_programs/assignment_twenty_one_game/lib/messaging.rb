module Messaging
  INCORRECT_ENTRY = "Sorry, incorrect input try again."

  def game_winner_message(winner)
    puts "#{winner} wins the game!!"
  end

  def goodbye_message
    puts "Thanks for playing the game of twenty-one!!  Goodbye!!"
  end

  def start_round_message
    puts "Start a new round!!"
  end

  def start_game_message
    puts "Start a new game!!"
  end

  def welcome_message
    <<-MSG
*******************************************************************
Welcome to the game of twenty-one!!

A game winner is the player who is the first to win ten rounds.
A bust is a win for the player who did not bust.
Draws add nothing to the game tally for each player.

At the end of the game, the player can continue or quit.
Game wins are not tracked, just round wins within the current game.
*******************************************************************
MSG
  end
end
