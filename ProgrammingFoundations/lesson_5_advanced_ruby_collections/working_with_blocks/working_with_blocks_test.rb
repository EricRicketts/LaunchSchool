require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class WorkingWithBlocksTest < Minitest::Test

  def test_nested_array
    arr = [[1, 2], [3, 4]]
    expected_array_return = [[1, 2], [3, 4]]
    result = []
    expected = [1, 3]
    resulting_array_return = arr.each do |sub_arr|
      result.push(sub_arr.first)
    end
    assert_equal(expected_array_return, resulting_array_return)
    assert_equal(expected, result)
  end

  def test_map_nested_array
    expected = [nil, nil]
    result = []
    assert_output ("1\n3\n") { result = [[1, 2], [3, 4]].map { |arr| puts arr.first} }
    assert_equal(expected, result)
  end

  def test_example_3
    arr = [[1, 2], [3, 4]]
    result = []
    expected = [1, 3]
    assert_output("1\n3\n") { result = arr.map {|ary| puts ary.first; ary.first} }
    assert_equal(expected, result)
  end

  def test_example_4
    arr = [[18, 7], [3, 12]]
    expected = [[18, 7], [3, 12]]
    result = []
    assert_output("18\n7\n12\n") { result = arr.each { |sub_arr| sub_arr.each { |num| puts num if num > 5} } }
    assert_equal(expected, result)
  end

  def test_example_5
    expected = [[2, 4], [6, 8]]
    result = [[1, 2], [3, 4]].map do |arr|
      arr.map do |num|
        num*2
      end
    end
    assert_equal(expected, result)
  end

  def test_example_6
    expected = [{ c: 'cat' }]
    result = [{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
      hash.all? do |key, value|
        value[0] == key.to_s
      end
    end
    assert_equal(expected, result)
  end

  def test_example_6a
    expected = [{ a: 'ant', b: 'elephant' }, { c: 'cat' }]
    result = [{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
      hash.any? do |key, value|
        value[0] == key.to_s
      end
    end
    assert_equal(expected, result)
  end

  def test_example_7
    arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
    expected = [['1', '8', '11'], ['1', '8', '9'], ['2', '12', '15'], ['2', '6', '13']]
    assert_equal(expected, arr.sort)
  end

  def test_example_7a
    arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
    expected = [['1', '8', '9'], ['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15']]
    result = arr.sort_by do |sub_ary|
      sub_ary.map(&:to_i)
    end 
    assert_equal(expected, result)  
  end

  def test_example_8
    expected = [[27], ['apple']]
    result = [[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
      arr.select do |item|
        if item.to_s.to_i == item    # if it's an integer
          item > 13
        else
          item.size < 6
        end
      end
    end
    assert_equal(expected, result)  
  end

  def test_example_9
    expected = [ [ [1], [2], [3], [4] ], [ ['a'], ['b'], ['c'] ] ]
    result = [ [ [1], [2], [3], [4] ], [ ['a'], ['b'], ['c'] ] ].map do |element1|
      element1.each do |element2|
        element2.partition do |element3|
          element3.size > 0
        end
      end
    end
    assert_equal(expected, result)    
  end

  def test_example_9a
    expected = [ 1234, 'abc' ]
    result = [ [ [1], [2], [3], [4] ], [ ['a'], ['b'], ['c'] ] ].map do |element1|
      element1.inject('') {|str, element2| str += element2.first.to_s}
    end.map {|e| e.match?(/[[:digit:]]+/) ? e.to_i : e}
    assert_equal(expected, result)    
  end

  def test_example_10
    expected = [[[2, 3], [4, 5]], [6, 7]]
    result = [[[1, 2], [3, 4]], [5, 6]].map do |arr|
      arr.map do |el|
        if el.to_s.size == 1    # it's an integer
          el + 1
        else                    # it's an array
          el.map do |n|
            n + 1
          end
        end
      end
    end
    assert_equal(expected, result)
  end   

  def test_example_11
    # do not mutate what you are iterating through
    expected = [ [ ['a'], ['b'], ['c'] ] ]
    arr = [[[1], [2], [3], [4]], [['a'], ['b'], ['c']]]
    result = arr.map do |arr2|
      arr.pop # returns last element in the array so now
      # the array has only one element [['a'], ['b'], ['c']]
      # so the iteration ends.
    end
    assert_equal(expected, result)
  end
        
end