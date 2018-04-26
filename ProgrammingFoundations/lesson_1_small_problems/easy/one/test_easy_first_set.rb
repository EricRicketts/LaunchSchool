require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class TestEasyFirstSet < Minitest::Test

  def repeat(str, reps)
    reps.times do
      puts str
    end
  end

  def test_repeat_yourself_1
    expected = "Hello\nHello\nHello\n"
    assert_output(expected) { repeat("Hello", 3) }
  end
  
end