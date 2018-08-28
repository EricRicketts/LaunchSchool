require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib'
require_relative '../lib/history'

class HistoryBasicsTest < Minitest::Test
  attr_accessor :history

  def setup
    @history = History.new
  end

  def test_history_class
    assert_instance_of(History, history)
  end

  def test_history_attribute
    assert_respond_to(history, :report)
  end

  def test_history_attribute_init
    expected = {
      round: 0,
      results: {
        human_move: '',
        computer_move: '',
        winner: '',
        human_tally: 0,
        computer_tally: 0
      }
    }
    assert_equal(expected, history.report)
  end
end