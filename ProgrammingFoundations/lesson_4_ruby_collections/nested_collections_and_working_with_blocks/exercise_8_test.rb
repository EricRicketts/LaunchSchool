require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
class Exercise8Test < Minitest::Test
  def test_arr_to_hsh
    arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
    expected = {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
    result = {}
    arr.each do |sub_array|
      result[sub_array.first] = sub_array.last
    end
    assert_equal expected, result
  end
end