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

  def play_round
    moves
    display_round_winner(round_winner)
  end

  def welcome
    "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  private

  def display_round_winner(round_winner)
    round_winner.empty? ? "It is a tie!" : "#{round_winner} won!"
  end

  def moves
    human.choose
    computer.choose
  end

  def round_winner
    case
    when human.move > computer.move then human.name
    when human.move < computer.move then computer.name
    else ""
    end
  end
end