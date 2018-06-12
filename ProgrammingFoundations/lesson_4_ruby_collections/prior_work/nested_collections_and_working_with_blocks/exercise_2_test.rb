require 'minitest/autorun'
require 'minitest/pride'

class Exercise2Test < Minitest::Test
  def test_change_value_first_array
    arr1 = [1, [2, 3], 4]
    arr1[1][1] = 4
    assert_equal [1, [2, 4], 4], arr1
  end

  def test_change_value_second_array
    arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
    arr2[2] = 4
    assert_equal [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 4], arr2
  end

  def test_change_value_first_hash
    hsh1 = {first: [1, 2, [3]]}
    hsh1[:first][2][0] = 4
    expected = {first: [1, 2, [4]]}
    assert_equal expected, hsh1
  end

  def test_change_value_second_hash
    hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
    hsh2[['a']][:a][2] = 4
    expected = {['a'] => {a: ['1', :two, 4], b: 4}, 'b' => 5}
    assert_equal expected, hsh2
  end
end