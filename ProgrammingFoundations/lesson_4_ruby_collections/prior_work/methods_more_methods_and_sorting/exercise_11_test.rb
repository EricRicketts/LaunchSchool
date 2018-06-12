require 'minitest/autorun'
require 'minitest/pride'

class Exercise11Test < Minitest::Test
  def test_sort
    arr = ['10', '11', '9', '7', '8']
    result = arr.map { |str| str.to_i }
                .sort { |a, b| b <=> a }
                .map { |num| num.to_s }
    assert_equal ['11', '10', '9', '8', '7'], result
  end
  def test_better_solution
    arr = ['10', '11', '9', '7', '8']
    result = arr.sort { |a, b| b.to_i <=> a.to_i }
    assert_equal ['11', '10', '9', '8', '7'], result
  end
end