require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class NestedDataStructuresTest < Minitest::Test

  def test_nested_array_update
    arr = [[1, 3], [2]]
    expected = [[1, 3], [2, 5]]
    arr[1][1] = 5
    assert_equal(expected, arr)  
  end

  def test_array_of_hashes
    arr = [{ a: 'ant' }, { b: 'bear' }]
    expected = [{ :a => "ant", :c => "cat" }, { :b => "bear" }]
    arr[0][:c] = 'cat'
    assert_equal(expected, arr)
  end

  def test_nested_structure_of_different_objects
    arr = [['a', ['b']], { b: 'bear', c: 'cat' }, 'cab']
    assert_equal(['a', ['b']], arr[0])
    assert_equal('b', arr[0][1][0])
    assert_equal({:b => 'bear', :c => 'cat'}, arr[1])
    assert_equal('bear', arr[1][:b])
    assert_equal('b', arr[1][:b][0])
    assert_equal('b', arr[2][2])
  end

  def test_variable_references_for_nested_collections
    a = [1, 3]
    b = [2]
    arr = [a, b]
    assert_equal([[1, 3], [2]], arr)
    b << 4
    assert_equal([[1, 3], [2, 4]], arr)
    arr[0][1] = 6
    assert_equal([[1, 6], [2, 4]], arr)
  end
  
end