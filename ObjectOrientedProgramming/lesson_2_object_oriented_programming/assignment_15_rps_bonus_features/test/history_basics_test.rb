require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib/history'

class HistoryBasicsTest < Minitest::Test
  attr_accessor :history

  def setup
    keys = [
      :round, :human_move, :computer_move, :winner,
      :human_tally, :computer_tally
    ]
    @history = History.new(keys)
  end

  def test_history_class
    # skip
    assert_instance_of(History, history)
  end

  def test_history_report_init
    # skip
    assert_equal([], history.report)
  end

  def test_history_keys_init
    # skip
    expected = [
      :round, :human_move, :computer_move, :winner,
      :human_tally, :computer_tally
    ]
    assert_equal(expected, history.keys)
  end
end