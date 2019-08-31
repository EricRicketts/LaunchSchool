require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise11Test < Minitest::Test
  attr_reader :arr

  def setup
    @arr = ["9", "8", "7", "10", "11"]
  end

  def test_wrong_results
    expected = %w(11 10 9 8 7)
    result = arr.sort { |x, y| y.to_i <=> x.to_i }
    assert_equal(expected, result)
  end
end

=begin
I did not understand to beging with, Launch School was asking for
the output due to p, however, p binds more tightly to an array so it
will bind with arr.sort before the block is executed, so it will sort
on the string of digits.
=end