require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
class Exercise11Test < Minitest::Test
  def test_pick_evens
    arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
    expected = [{ e: [8], f: [6, 10] }]

    result = []
    arr.each do |hsh|
      result.push(hsh) if hsh.values.flatten.all?(&:even?)
    end
    assert_equal expected, result
  end
end