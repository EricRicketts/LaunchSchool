require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'
require_relative './error_checks'

class ErrorTest < Minitest::Test
  include ErrorChecks

  def test_first
    assert_raises(InvalidNumberOfPinsError) { invalid_number_of_pins?(-1) }
  end

  def test_second
    assert_raises(RuntimeError, 'Pins must have a value from 0 to 10') { invalid_number_of_pins?(11) }
  end

  def test_third
    assert_nil(invalid_number_of_pins?(5))
  end

end
