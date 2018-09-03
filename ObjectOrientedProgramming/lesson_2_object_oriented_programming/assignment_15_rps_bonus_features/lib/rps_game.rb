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

  def display_moves
    "#{human.name} chose #{human.move}, "\
      "#{computer.name} chose #{computer.move}."
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
    loop do
      round_winner = play_round
      puts round_winner
      history.update(human, computer, round_winner)
      puts history.output
      if game_winner?
        puts game_winner
        history.reset
        break unless play_again?
      end
    end
    goodbye
  end

  def play_round
    moves
    winner = round_winner
    display_round_winner(winner)
  end

  def welcome
    "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  private

  def display_round_winner(winner)
    winner.empty? ? "It is a tie!" : "#{round_winner} won!"
  end

  def moves
    human.choose
    computer.choose
  end

  def round_winner
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