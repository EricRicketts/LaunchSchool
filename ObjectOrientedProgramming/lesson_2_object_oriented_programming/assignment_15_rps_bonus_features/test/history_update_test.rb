require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib/history'
require_relative '../lib/human'
require_relative '../lib/computer'
require_relative '../lib/move'


class HistoryUpdateTest < Minitest::Test
  attr_accessor :history, :human, :computer

  def setup
    @history = History.new
    @human = Human.allocate
    @computer = Computer.new

    human.name = "Eric"
    human.tally = 0
    human.move = Move.new(Paper.new)

    computer.name = "HAL 9000"
    computer.move = Move.new(Scissors.new)
    computer.tally = 1

    history.update(human, computer, computer.name)
  end

  def teardown
    history.reset
  end

  def test_update_report_winner
    # skip
    expected = [
      {
        round: 1, human_move: "Paper", computer_move: "Scissors",
        winner: "HAL 9000", human_tally: 0, computer_tally: 1
      },
      {
        round: 2, human_move: "Spock", computer_move: "Rock",
        winner: "Eric", human_tally: 1, computer_tally: 1
      }
    ]
    human.move = Move.new(Spock.new)
    human.tally += 1
    computer.move = Move.new(Rock.new)
    history.update(human, computer, human.name)
    assert_equal(expected, history.report)
  end

  def test_update_report_tie
    # skip
    expected = [
      {
        round: 1, human_move: "Paper", computer_move: "Scissors",
        winner: "HAL 9000", human_tally: 0, computer_tally: 1
      },
      {
        round: 2, human_move: "Rock", computer_move: "Rock",
        winner: "Tie", human_tally: 0, computer_tally: 1
      }
    ]
    human.move = Move.new(Rock.new)
    computer.move = Move.new(Rock.new)
    winner = "It is a tie!"
    history.update(human, computer, winner)
    assert_equal(expected, history.report)
  end
end