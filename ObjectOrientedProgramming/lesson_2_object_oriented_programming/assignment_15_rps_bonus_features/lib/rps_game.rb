require_relative './human'
require_relative './computer'
require_relative './history'

class RPSGame
  attr_accessor :human, :computer, :history

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history = History.new
  end

  def display_game_winner
    winner = human.tally == 10 ? human.name : computer.name
    "#{winner} wins the game!!"
  end

  def display_moves
    "#{human.name} chose #{human.move}, "\
      "#{computer.name} chose #{computer.move}."
  end

  def display_round_winner(round_winner)
    round_winner.empty? ? "It is a tie!" : "#{round_winner} won!"
  end

  def game_winner?
    human.tally == 10 || computer.tally == 10
  end

  def goodbye
    "Thanks for playing Rock, Paper, Scissors, Lizard, Spock!  Goodbye!"
  end

  def play_again?
    answer = ''
    loop do
      puts "Would you like to play another game? (y/n)"
      answer = gets.downcase.chomp
      break if ['y', 'n'].include?(answer)
      puts "Sorry, must be y or n."
    end
    answer == 'y'
  end

  def play
    puts welcome
    loop do
      play_a_round
      if game_winner?
        puts display_game_winner
        reset_game
        break unless play_again?
      end
    end
    puts goodbye
  end

  def play_a_round
    moves
    puts display_moves
    round_winner = determine_round_winner
    puts display_round_winner(round_winner)

    update_tally(round_winner)
    history.update(human, computer, round_winner)
    puts history.output(human, computer)
  end

  def welcome
    "Welcome to Rock, Paper, Scissors, Lizard, Spock!\n"\
    "Each game consists of a number of rounds.\n"\
    "The player choses rock, paper, scissors, lizard or spock.\n"\
    "The computer will randomly select one of those options.\n"\
    "The first to win 10 rounds wins the game."
  end

  private

  def determine_round_winner
    case
    when human.move > computer.move then human.name
    when human.move < computer.move then computer.name
    else ""
    end
  end

  def moves
    human.choose
    computer.choose
  end

  def reset_game
    human.tally = 0
    computer.tally = 0
    history.reset
  end

  def update_tally(round_winner)
    case round_winner
    when human.name then human.tally += 1
    when computer.name then computer.tally += 1
    end
  end
end