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
      puts "Would you like to play again? (y/n)"
      answer = gets.downcase.chomp
      break if ['y', 'n'].include?(answer)
      puts "Sorry, must be y or n."
    end
    answer == 'y'
  end

  def play
    puts welcome
    loop do
      round_winner = play_round
      puts display_round_winner(round_winner)
      # binding.pry
      history.update(human, computer, round_winner)
      puts history.output(human, computer)
      if game_winner?
        puts display_game_winner
        history.reset
        break unless play_again?
      end
    end
    goodbye
  end

  def play_round
    moves
    puts display_moves
    determine_round_winner
  end

  def welcome
    "Welcome to Rock, Paper, Scissors, Lizard, Spock!\n"\
    "Each game consists of a number of rounds.\n"\
    "The player choses rock, paper, scissors, lizard or spock.\n"\
    "The computer will randomly select one of those options.\n"\
    "The first to win 10 rounds wins the game."
  end

  private


  def moves
    human.choose
    computer.choose
  end

  def determine_round_winner
    case
    when human.move > computer.move
      human.tally += 1
      human.name
    when human.move < computer.move
      computer.tally += 1
      computer.name
    else ""
    end
  end
end