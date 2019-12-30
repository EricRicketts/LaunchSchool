require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Merge Sort

Sort an array of passed in values using merge sort. You can assume that this array may contain only one type of data.
And that data may be either all numbers or all strings.

Merge sort is a recursive sorting algorithm that works by breaking down the array elements into nested sub-arrays,
then recombining those nested sub-arrays in sorted order. It is best shown by example. For instance, let's merge sort
the array [9,5,7,1]. Breaking this down into nested sub-arrays, we get:

[9, 5, 7, 1] ->
[[9, 5], [7, 1]] ->
[[[9], [5]], [[7], [1]]]
We then work our way back to a flat array by merging each pair of nested sub-arrays:

[[[9], [5]], [[7], [1]]] ->
[[5, 9], [1, 7]] ->
[1, 5, 7, 9]
Examples:

merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
merge_sort([5, 3]) == [3, 5]
merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

AL:
  - we divide the array of sub_arrays of two
  - then we divide again and put each of the elements into its own array
=end

class EighthExercise < Minitest::Test

  def merge(array1, array2)
    smaller, larger = (array2.size > array1.size) ? [array1, array2] : [array2, array1]
    smaller_idx = 0
    result = []

    larger.each do |value|
      while smaller_idx < smaller.size && smaller[smaller_idx] <= value
        result << smaller[smaller_idx]
        smaller_idx += 1
      end
      result << value
    end

    result.concat(smaller[smaller_idx..-1])
  end

  def make_pairs(arr)
    all_pairs = []
    arr.each_slice(2).each.with_index do |pair, idx|
      if pair.size == 1
        all_pairs[idx - 1].push(pair)   
      else
        (pair.last < pair.first) ? all_pairs.push([[pair.last], [pair.first]]) :
        all_pairs.push([[pair.first], [pair.last]])
      end
    end

    last_index = all_pairs.size - 1

    if arr.size.odd?
      tuple = all_pairs[last_index].flatten
      if tuple.last < tuple.first
        all_pairs[last_index] = [[tuple.last], [tuple.first], [tuple[1]]]
      elsif tuple.first < tuple.last && tuple.last < tuple[1]
        all_pairs[last_index] = [[tuple.first], [tuple.last], [tuple[1]]]
      end
    end

    all_pairs
  end

  def merge_sort(arr)
    all_pairs = make_pairs(arr)
  end

  def test_1
    skip
    expected = [1, 5, 7, 9]
    result = merge_sort([9, 5, 7, 1])
    assert_equal(expected, result)    
  end 

  def test_2
    skip
    expected = [3, 5]
    result = merge_sort([5, 3]) 
    assert_equal(expected, result)
  end 

  def test_3
    # skip
    expected = [1, 2, 4, 6, 7]
    result = merge_sort([6, 2, 7, 1, 4]) 
    # assert_equal(expected, result)    
  end 

  def test_4
    skip
    expected = %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
    result = merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie))
    assert_equal(expected, result)    
  end 

  def test_5
    skip
    expected = [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
    result = merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46])
    assert_equal(expected, result)        
  end 

end