require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
class Exercise6Test < Minitest::Test
  def test_increment_array_of_hashes_by_one
    # this solution works but it is not preferred since each
    # original hash is being changed during the course of iteration
    # the Launch School solution show afterwards starts with an empty
    # hash and then adds to it during the course of the iteration
    arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
    expected = [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]
    result = arr.map do |hsh|
      hsh.each do |key, value|
        hsh[key] = value + 1
      end
    end
    assert_equal expected, result
  end

  def test_increment_array_of_hashes_by_one_better_way
    arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
    expected = [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]
    result = arr.map do |hsh|
      temp_hsh = {}
      hsh.each do |key, value|
        temp_hsh[key] = value + 1
      end
      temp_hsh
    end
    assert_equal expected, result
  end
end