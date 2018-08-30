require_relative './human'
require_relative './computer'

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def welcome
    "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def goodbye
    "Thanks for playing Rock, Paper, Scissors, Lizard, Spock!  Goodbye!"
  end

end