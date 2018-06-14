require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class SeventhExercise < Minitest::Test

=begin
Even Numbers

Print the even numbers from 1 to 99, inclusive.
All numbers should be printed on separate lines.
=end

  def get_evens_to_99
    (1...99).to_a.select(&:even?)
  end

  def test_get_evens
    ary = (0...99).step(2).to_a
    ary.shift
    assert_equal(ary, get_evens_to_99)
  end

end