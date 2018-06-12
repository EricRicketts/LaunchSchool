require 'minitest/autorun'
require 'minitest/pride'

class Exercise1Test < Minitest::Test
  def test_complex_access
    arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
    arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
    arr3 = [['abc'], ['def'], {third: ['ghi']}]
    hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
    hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

    assert_equal 'g', arr1[2][1][3]
    assert_equal 'g', arr2[1][:third].first
    assert_equal 'g', arr3[2][:third].first[0]
    assert_equal 'g', hsh1['b'][1]
    assert_equal 'g', hsh2[:third].keys.first
    assert_equal 'g', hsh2[:third].key(0) # solution on website, key returns key of hash selected
  end
end