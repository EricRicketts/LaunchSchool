require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib/history'
require_relative '../lib/human'
require_relative '../lib/computer'
require_relative '../lib/move'


class HistoryUpdateTest < Minitest::Test
  attr_accessor :history

  def setup
    keys = [
      :round, :human_move, :computer_move,
      :winner, :human_tally, :computer_tally
    ]
    @history = History.new(keys)
  end

  def test_history_update
    # skip
    expected = [
      {
        round: "1", human_move: "Paper", computer_move: "Scissors",
        winner: "HAL 9000", human_tally: "0", computer_tally: "1"
      },
      {
        round: "2", human_move: "Spock", computer_move: "Rock",
        winner: "Eric", human_tally: "1", computer_tally: "1"
      },
      {
        round: "3", human_move: "Rock", computer_move: "Rock",
        winner: "Tie", human_tally: "1", computer_tally: "1"
      }
    ]
    first_round = ["1", "Paper", "Scissors", "HAL 9000", "0", "1"]
    second_round = ["2", "Spock", "Rock", "Eric", "1", "1"]
    third_round = ["3", "Rock", "Rock", "Tie", "1", "1"]
    [first_round, second_round, third_round].each do |round|
      history.update(round)
    end
    assert_equal(expected, history.report)
  end
end