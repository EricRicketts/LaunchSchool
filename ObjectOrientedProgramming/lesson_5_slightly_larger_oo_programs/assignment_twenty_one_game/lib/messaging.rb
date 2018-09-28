module Messaging
  INCORRECT_ENTRY = "Sorry, incorrect input try again."

  def game_winner_message(winner)
    puts "#{winner} wins the game!!"
    puts
  end

  def goodbye_message
    puts "Thanks for playing the game of twenty-one!!  Goodbye!!"
  end

  def start_round_message
    puts "Start a new round!!"
    puts
  end

  def start_game_message
    puts "Start a new game!!"
    puts
  end

  def welcome_message
    puts "Welcome to the game of twenty-one!!"
    puts
    puts "A game winner is the player who is the first to win ten rounds."
    puts "A bust is a win for the player who did not bust."
    puts "Draws add nothing to the game tally for each player."
    puts
    puts "At the end of the game, the player has the option to continue or quit."
    puts "Game wins are not tracked, just round wins within the current game."
    puts
  end
end
