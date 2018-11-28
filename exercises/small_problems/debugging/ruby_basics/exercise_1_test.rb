require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise1Test < Minitest::Test

  def find_first_nonzero_among(numbers)
    numbers.each do |n|
      return n if n.nonzero?
    end
  end

  def test_0
    # There is no Integer#each method
    # skip
    assert_raises(NoMethodError) { find_first_nonzero_among(1) }
  end

  def test_1
    # too many arguments, 1 is expected, but 6 are provided
    # skip
    assert_raises(ArgumentError) { find_first_nonzero_among(0, 0, 1, 0, 2, 0) }
  end

end
