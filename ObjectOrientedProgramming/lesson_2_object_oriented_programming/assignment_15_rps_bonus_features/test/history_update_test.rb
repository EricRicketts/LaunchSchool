require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib'
require_relative '../lib/history'
require_relative '../lib/human'
require_relative '../lib/computer'
require_relative '../lib/move'


class HistoryUpdateTest < Minitest::Test
  attr_accessor :history, :human, :computer

  def setup
    @history = History.new
    @human = Human.new
    @computer = Computer.new
  end

  def test_update_report
    expected = [
      {
        round: 1,
        results: {
          human_move: "Rock",
          computer_move: "Scissors",
          winner: "Eric",
          human_tally: 1,
          computer_tally: 0
        }
      }
    ]
    human.name = "Eric"
    human.move = Move.new(Rock.new)
    human.tally += 1
    computer.move = Move.new(Scissors.new)
    history.update(human, computer, human.name)
    update = history.report
    history.reset
    assert_equal([expected, []], [update, history.report])
  end
end