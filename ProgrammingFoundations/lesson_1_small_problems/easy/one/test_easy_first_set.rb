require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class TestEasyFirstSet < Minitest::Test

  def repeat(str, reps)
    str*reps
  end

  def test_repeat_yourself_1
    expected = "Hello\nHello\nHello\n"
    assert_equal(expected, repeat("Hello\n", 3))
  end
  
end