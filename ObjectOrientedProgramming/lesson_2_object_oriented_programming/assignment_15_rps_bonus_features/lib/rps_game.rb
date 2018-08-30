require_relative './human'
require_relative './computer'

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_moves
    "#{human.name} chose #{human.move}, "\
      "#{computer.name} chose #{computer.move}."
  end

  def goodbye
    "Thanks for playing Rock, Paper, Scissors, Lizard, Spock!  Goodbye!"
  end

  def moves
    human.choose
    computer.choose
  end

  def welcome
    "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

end