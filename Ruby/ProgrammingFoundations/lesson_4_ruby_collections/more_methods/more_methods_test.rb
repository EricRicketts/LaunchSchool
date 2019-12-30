require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class MoreMethodsTest < Minitest::Test

  def test_any_with_array
    arr = (0..10).to_a
    assert(arr.any? {|n| (n % 4).zero?})
  end

  def test_any_with_hash
    hsh = ('a'..'d').zip(0..3).to_h
    refute(hsh.any? {|k, v| k > 'e' && v > 4})
  end

  def test_all_with_array
    assert((0..5).all? {|n| n < 6})    
  end

  def test_all_with_hash
    hsh = ('a'..'d').zip(0..3).to_h
    assert(hsh.all? {|k, v| k < 'e' && v < 4})    
  end
 
  def test_each_index_with_hash
    hsh = ('a'..'d').zip(0..3).to_h
    result = []
    expected = [['a', 0], 0, ['b', 1], 1, ['c', 2], 2, ['d', 3], 3]
    hsh.each.with_index do |pair, idx|
      result.push(pair, idx)
    end
    assert_equal(expected, result)
  end

  def test_each_with_object_on_hsh
    hsh = ('a'..'e').zip(0..4).to_h
    result = hsh.each_with_object({}) do |(key, value), h|
      h[key] = value*2
    end
    expected = ('a'..'e').zip((0..8).step(2).to_a).to_h
    assert_equal(expected, result)
  end

  def test_each_with_object_on_hsh_using_pair
    hsh = ('a'..'e').zip(0..4).to_h
    result = hsh.each_with_object({}) do |pair, h|
      h[pair.first] = pair.last*2
    end
    expected = ('a'..'e').zip((0..8).step(2).to_a).to_h
    assert_equal(expected, result)
  end

  def test_first_on_array
    assert_equal((0..5).to_a, (0..10).to_a.first(6))    
  end

  def test_first_on_hash
    hsh = ('a'..'e').zip(0..4).to_h
    expected = [['a', 0], ['b', 1]]    
    assert_equal(expected, hsh.first(2))    
  end

  def test_last_on_array
    # last is only Array#last
    assert_equal([8, 9, 10], (0..10).to_a.last(3))
  end

  def test_partition_on_array
    arr = (0..9).to_a
    expected = [(0..4).to_a, (5..9).to_a]
    assert_equal(expected, arr.partition {|n| n < 5})
  end

  def test_partition_on_hash
    hsh = ('a'..'j').zip(0..9).to_a.to_h
    expect_select = ('a'..'e').zip(0..4).to_h
    expect_reject = ('f'..'j').zip(5..9).to_h
    selected, rejected = hsh.partition {|k, v| k < 'f' && v < 5}
    selected, rejected = selected.to_h, rejected.to_h
    assert_equal([expect_select, expect_reject], [selected, rejected])
  end

end