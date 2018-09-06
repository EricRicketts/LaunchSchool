module Statements
  def moves_string(human_name, human_move, computer_name, computer_move)
    "#{human_name} chose #{human_move}, "\
      "#{computer_name} chose #{computer_move}.\n"
  end

  def display_game_winner(winner)
    puts "#{winner} wins the game!!"
  end

  def display_round_results(human_name, human_move, computer_name,
                            computer_move, round_winner)
    str1 = moves_string(human_name, human_move, computer_name, computer_move)
    str2 = round_winner_string(round_winner)
    puts str1.concat(str2)
  end

  def round_winner_string(round_winner)
    result = round_winner == "Tie" ? "It is a tie!" : "#{round_winner} won!"
    result.concat("\n")
  end

  def goodbye
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock!  Goodbye!"
  end

  def welcome
    str = "Welcome to Rock, Paper, Scissors, Lizard, Spock!\n"\
    "Each game consists of a number of rounds.\n"\
    "The player choses rock, paper, scissors, lizard or spock.\n"\
    "The computer will randomly select one of those options.\n"\
    "The first to win 10 rounds wins the game."

    puts str
  end
end
