require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib/history'

class HistoryBasicsTest < Minitest::Test
  attr_accessor :history

  def setup
    @history = History.new
  end

  def test_history_class
    # skip
    assert_instance_of(History, history)
  end

  def test_history_attribute
    # skip
    assert_respond_to(history, :report)
  end

  def test_history_attribute_init
    # skip
    assert_equal([], history.report)
  end
end