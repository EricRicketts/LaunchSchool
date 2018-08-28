require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib'
require_relative '../lib/history'

class HistoryUpdateTest < Minitest::Test
  attr_accessor :history

  def setup
    @history = History.new
  end

  def test_update_report
    expected = {
      round: 1,
      results: {
        human_move: "Rock",
        computer_move: "Scissors",
        Winner: "Eric",
        human_tally: 1,
        computer_tally: 0
      }
    }
  end
end