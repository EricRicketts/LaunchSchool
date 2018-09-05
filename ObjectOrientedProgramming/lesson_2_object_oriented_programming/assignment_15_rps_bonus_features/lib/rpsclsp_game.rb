require_relative './human'
require_relative './computer'
require_relative './history'

class RPScLSpGame
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
        end_of_game_cleanup
        break unless play_again?
      end
    end
    puts goodbye
  end

  def play_a_round
    round_winner = compare_moves_and_declare_winner
    update_and_display_history(round_winner)
  end

  def welcome
    "Welcome to Rock, Paper, Scissors, Lizard, Spock!\n"\
    "Each game consists of a number of rounds.\n"\
    "The player choses rock, paper, scissors, lizard or spock.\n"\
    "The computer will randomly select one of those options.\n"\
    "The first to win 10 rounds wins the game."
  end

  private

  def compare_moves_and_declare_winner
    make_moves
    puts display_moves

    round_winner = determine_round_winner
    puts display_round_winner(round_winner)
    round_winner
  end

  def determine_round_winner
    if human.move > computer.move
      human.name
    elsif human.move < computer.move
      computer.name
    else
      ""
    end
  end

  def end_of_game_cleanup
    puts display_game_winner
    reset_game
  end

  def make_moves
    human.choose
    computer.choose
  end

  def reset_game
    human.tally = 0
    computer.tally = 0
    history.reset
  end

  def update_and_display_history(round_winner)
    update_tally(round_winner)
    history.update(human, computer, round_winner)
    puts history.output(human, computer)
  end

  def update_tally(round_winner)
    case round_winner
    when human.name then human.tally += 1
    when computer.name then computer.tally += 1
    end
  end
end
