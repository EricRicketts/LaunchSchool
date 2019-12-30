require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class SortingTest < Minitest::Test

  def test_0
    # skip
    expected = %W(ants arc bat cap cape)
    assert_equal(expected, ['arc', 'bat', 'cape', 'ants', 'cap'].sort)
  end

  def test_1
    # skip
    expected = [['a', 'car', 'd'], ['a', 'car', 'd', 3], ['a', 'cat', 'b', 'c'], ['b', 2]]
    result = [['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort
    assert_equal(expected, result)
  end

  def test_2
    # sort by the second letter in each string
    # skip
    expected = ["mat", "bed", "cot"]
    result = ['cot', 'bed', 'mat'].sort_by {|word| word[1]}
    assert_equal(expected, result)
  end

  def test_3
    # skip
    people = { Kate: 27, John: 25, Mike: 18 }
    expected = { Mike: 18, John: 25, Kate: 27 }
    result = people.sort_by {|k, v| v}.to_h
    assert_equal(expected, result)
  end
  
  def test_4
    # skip
    people = { Kate: 27, John: 25, Mike: 18 }
    expected = { John: 25, Kate: 27, Mike: 18  }
    result = people.sort_by {|k, v| k}.to_h
    assert_equal(expected, result)
  end
  
end