require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise3Test < Minitest::Test

  def valid_series?(nums)
    return false if nums.sum != 47

    odd_count = nums.count { |n| n.odd? }
    odd_count = 3 ? true : false
  end

  def valid_series_fix?(nums)
    return false if nums.sum != 47

    odd_count = nums.count { |n| n.odd? }
    odd_count == 3
  end

  def test_wrong_result

    assert(valid_series?([5, 6, 2, 7, 3, 12, 4, 8]))
    refute(valid_series?([1, 12, 2, 5, 16, 6]))
    refute(valid_series?([28, 3, 4, 7, 9, 14]))
    assert(valid_series?([20, 6, 9, 4, 2, 1, 2, 3]))
    assert(valid_series?([10, 6, 19, 2, 6, 4])) # should return false
  end

  def test_fix

    assert(valid_series_fix?([5, 6, 2, 7, 3, 12, 4, 8]))
    refute(valid_series_fix?([1, 12, 2, 5, 16, 6]))
    refute(valid_series_fix?([28, 3, 4, 7, 9, 14]))
    assert(valid_series_fix?([20, 6, 9, 4, 2, 1, 2, 3]))
    refute(valid_series_fix?([10, 6, 19, 2, 6, 4]))
  end
end