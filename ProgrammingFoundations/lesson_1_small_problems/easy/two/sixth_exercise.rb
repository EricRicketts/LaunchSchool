require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class SixthExercise < Minitest::Test

=begin
Odd Numbers
Print all odd numbers from 1 to 99, inclusive.
All numbers should be printed on separate lines.
=end


  def get_odds(num)
    num.odd? ? (1..num).step(2).to_a : (1...num).step(2).to_a
  end

  def test_to_21
    assert_equal([1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21], get_odds(21))
  end
  
  def test_to_16
    assert_equal([1, 3, 5, 7, 9, 11, 13, 15], get_odds(16))
  end
  
end