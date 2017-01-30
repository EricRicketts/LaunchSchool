require 'minitest/autorun'
require 'minitest/pride'

class Exercise3Test < Minitest::Test
  def test_variables_and_arrays
    a = 2
    b = [5, 8]
    arr = [a, b]

    arr[0] += 2
    arr[1][0] -= a


    assert_equal 2, a # a is not 4 as we are modifying arr not a
    assert_equal [3, 8], b # since a remains 2, the first element of b gets decremented by 2
  end
end