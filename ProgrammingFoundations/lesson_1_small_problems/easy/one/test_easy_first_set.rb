require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class TestEasyFirstSet < Minitest::Test

  def repeat(str, reps)
    reps.times do
      puts str
    end
  end

  def is_odd?(int)
    # int.abs % 2 == 1
    # above solution requires the
    # #abs to ensure result is 1 or 0
    # below any even number, positive or
    # negative modulus 2 is zero. 
    !(int % 2).zero?
  end

  def test_1_repeat_yourself
    expected = "Hello\nHello\nHello\n"
    assert_output(expected) { repeat("Hello", 3) }
  end

  def test_2_odd
    odd_arr = [5, -17, 7]
    even_arr = [2, -8, 0]
    assert(odd_arr.all? {|n| is_odd?(n)} && even_arr.none? {|n| is_odd?(n)})
  end
  
end