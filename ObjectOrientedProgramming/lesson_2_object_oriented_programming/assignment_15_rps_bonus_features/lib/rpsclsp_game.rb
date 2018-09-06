require_relative './human'
require_relative './computer'
require_relative './history'
require_relative './table'
require_relative './statements'
require_relative './data_initialization'

class RPScLSpGame
  include Statements
  include DataInitialization
  attr_accessor :human, :computer, :history, :table

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history = History.new(set_keys)
    names = [human.name, computer.name]
    @table = Table.new(set_header(*names), "scissors")
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

  private

  def compare_moves
    make_moves
    round_winner = determine_round_winner
    round_winner.empty? ? "Tie" : round_winner
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
    winner = human.tally == 10 ? human.name : computer.name
    display_game_winner(winner)
    reset_game
  end

  def game_winner?
    human.tally == 10 || computer.tally == 10
  end

  def get_round_results(round_winner)
    human_move = human.move.to_s
    computer_move = computer.move.to_s
    round = (history.size + 1).to_s
    [
      round, human_move, computer_move, round_winner,
      human.tally.to_s, computer.tally.to_s
    ]
  end

  def make_moves
    human.choose
    computer.choose
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

  def play_a_round
    round_winner = compare_moves

    round_result_input = [
      human.name, human.move, computer.name,
      computer.move, round_winner
    ]
    puts display_round_results(*round_result_input)

    update_history(round_winner)
    puts table.output(history.data)
  end

  def reset_game
    human.tally = 0
    computer.tally = 0
    history.reset
  end

  def update_history(round_winner)
    update_tally(round_winner)
    history.update(get_round_results(round_winner))
  end

  def update_tally(round_winner)
    case round_winner
    when human.name then human.tally += 1
    when computer.name then computer.tally += 1
    end
  end
end
