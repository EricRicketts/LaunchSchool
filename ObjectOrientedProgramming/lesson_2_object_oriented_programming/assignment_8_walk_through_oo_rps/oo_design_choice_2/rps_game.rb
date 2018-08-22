require_relative './computer'
require_relative './human'

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_goodbye_message
    "Thanks for playing Rock, Paper, Scissors.  Good bye!"
  end

  def display_moves
    "#{human.name} chose #{human.move}, "\
      "#{computer.name} chose #{computer.move}."
  end

  def display_welcome_message
    "Welcome to Rock, Paper, Scissors!"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif computer.move > human.move
      puts "#{computer.name} won!"
    else
      puts "It is a tie!"
    end
  end

  def play
    puts display_welcome_message
    loop do
      human.choose
      computer.choose
      puts display_moves
      puts display_winner
      break unless play_again?
    end

    puts display_goodbye_message
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)?"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer)
      puts "Sorry, must be y or n."
    end
    answer == 'y'
  end
end

RPSGame.new.play
