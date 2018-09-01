require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib/history'
require_relative '../lib/human'
require_relative '../lib/computer'
require_relative '../lib/move'

class HistoryOutputTest < Minitest::Test
  attr_accessor :history, :human, :computer

  def setup
    @human = Human.allocate
    human.tally = 1
    human.name = "Elmer Fudd"
    human.move = Move.new(Spock.new)

    @computer = Computer.new
    computer.name = "HAL 9000"
    computer.move = Move.new(Lizard.new)
    computer.tally = 2

    @history = History.new
    history.report = [
      { round: 1, results: {
        human_move: "Scissors", computer_move: "Paper", winner: "Elmer Fudd",
        human_tally: 1, computer_tally: 0
        }
      },
      { round: 2, results: {
        human_move: "Rock", computer_move: "Rock", winner: "Tie",
        human_tally: 1, computer_tally: 0
        }
      },
      { round: 3, results: {
        human_move: "Rock", computer_move: "Paper", winner: "HAL 9000",
        human_tally: 1, computer_tally: 1
        }
      }
    ]
    history.update(human, computer, computer.name)
  end

  def test_history_output
    expected_header = "| round | Elmer Fudd | HAL 9000 | Winner | Elmer Fudd Tally | HALL 9000 Tally |\n"
    row_separator =   "_______________________________________________________________________________\n"
  end
end