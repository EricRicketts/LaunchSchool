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
      { round: 1, human_move: "Scissors", computer_move: "Paper", winner: "Elmer Fudd",
        human_tally: 1, computer_tally: 0
      },
      { round: 2, human_move: "Rock", computer_move: "Rock", winner: "Tie",
        human_tally: 1, computer_tally: 0
      },
      { round: 3, human_move: "Rock", computer_move: "Paper", winner: "HAL 9000",
        human_tally: 1, computer_tally: 1
      }
    ]
    history.update(human, computer, computer.name)
  end

  def test_history_output
    expected = ''
    expected_header = "| round | Elmer Fudd | HAL 9000 |   Winner   | Elmer Fudd tally | HAL 9000 tally |\n"
    row_separator =   "----------------------------------------------------------------------------------\n"
    expected_header << row_separator
    first_row = "|   1   |  Scissors  |  Paper   | Elmer Fudd |        1         |       0        |\n" << row_separator
    second_row = "|   2   |    Rock    |   Rock   |    Tie     |        1         |       0        |\n" << row_separator
    third_row = "|   3   |    Rock    |  Paper   |  HAL 9000  |        1         |       1        |\n" << row_separator
    fourth_row = "|   4   |   Spock    |  Lizard  |  HAL 9000  |        1         |       2        |\n" << row_separator
    expected << expected_header << first_row << second_row << third_row << fourth_row
    results = history.output(human, computer)
    assert_equal(expected, results)
  end
end
