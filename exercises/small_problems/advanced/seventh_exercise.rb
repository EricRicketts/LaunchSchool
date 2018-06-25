require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Merge Sorted Lists
Write a method that takes two sorted Arrays as arguments,
and returns a new Array that contains all elements from
both arguments in sorted order.

You may not provide any solution that requires you to sort the result array.
You must build the result array one element at a time in the proper order.

Your solution should not mutate the input arrays.

Examples:

merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]

AL:
  - make an emtpy array which will hold the sorted results
  - compare first item from each array
    - if first <= second leave as is otherwise reverse the order 
      which will be inserted into the result array
    - say we have [1, 1, 3], [2, 2] end is [1, 1, 2, 2, 3]
    - after the first iteration we have [1, 2] now the next pair is again [1, 2]
    - first then we need to do is sort this pair, so after sorting we have [1, 2]
    - so we know the first is less than the second in this 2 element array, so now
    - what are guaranteed that the first element in this subarray is >= to the min
    - element in the resulting array, we just have to see if it is <= max element in the
    resulting array.  if it is <= max element then we need to insert before the last
    element in the resulting array, then the remaining item can go after the last element
    in the resulting array

    - we also know that if one array is smaller than the other array that we only need to
    iterate over the smaller array, as the remaining items in the larger array can just
    be appended to the result.
=end

class SeventhExercise < Minitest::Test

  def merge(arr1, arr2)
    return arr1 if arr2.empty?
    return arr2 if arr1.empty?

    result = []
    if arr1.size <= arr2.size
      smaller, larger = arr1, arr2
    else
      smaller, larger = arr2, arr1
    end

    start_index_of_remaining_elements = 0

    smaller.each.with_index do |n1, idx1|
      n2 = larger[idx1]
      ordered_pair = (n1 <= n2) ? [n1, n2] : [n2, n1]
      if result.empty?
        result.push(*ordered_pair)
      else
        current_max = result.max
        if ordered_pair.first < current_max
          last_idx = result.size - 1
          result[last_idx] = ordered_pair.first
          result.push(current_max, ordered_pair.last)
        else
          result.push(*ordered_pair)
        end
      end
      start_index_of_remaining_elements = idx1
    end

    return result if smaller.size == larger.size

    start_index_of_remaining_elements += 1
    result.push(*larger[start_index_of_remaining_elements..-1])

  end

  def test_1
    # skip
    expected = [1, 2, 5, 6, 8, 9]
    result = merge([1, 5, 9], [2, 6, 8])
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = [1, 1, 2, 2, 3]
    result = merge([1, 1, 3], [2, 2])
    assert_equal(expected, result)
  end

  def test_3
    # skip
    expected = [1, 1, 2, 2, 3]
    result = merge([2, 2], [1, 1, 3])
    assert_equal(expected, result)
  end
  
  def test_4
    # skip
    expected = [1, 4, 5]
    result = merge([], [1, 4, 5])
    assert_equal(expected, result)
  end
  
  def test_5
    # skip
    expected = [1, 4, 5]
    result = merge([1, 4, 5], [])
    assert_equal(expected, result)
  end
  
end

class SeventhExerciseAlternateSolution < Minitest::Test

  def merge_pairs(pairs)
    result = []
    doubles, singles = pairs.partition {|pair| pair.size == 2}
    singles.flatten!

    doubles.each.with_index do |pair, idx|
      next result.push(*pair) if idx.zero?
      current_max = result.last
      last_idx = result.size - 1
      if pair.first < current_max
        result[last_idx] = pair.first
        result.push(current_max, pair.last)
      else
        result.push(*pair)
      end
    end
    result.push(*singles) if singles.size > 0
    result
  end

  def sort_pairs!(pairs)
    pairs.map! do |pair|
      (pair.size == 2 && pair.last < pair.first) ? [pair.last, pair.first] : pair
    end
  end

  def merge(arr1, arr2)
    return arr1 if arr2.empty?
    return arr2 if arr1.empty?

    pairs = (arr1.size > arr2.size) ? arr1.zip(arr2) : arr2.zip(arr1) 
    pairs.map! {|pair| pair.compact}

    sort_pairs!(pairs)
    merge_pairs(pairs)
  end

  def test_1
    # skip
    expected = [1, 2, 5, 6, 8, 9]
    result = merge([1, 5, 9], [2, 6, 8])
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = [1, 1, 2, 2, 3]
    result = merge([1, 1, 3], [2, 2])
    assert_equal(expected, result)
  end

  def test_3
    # skip
    expected = [1, 1, 2, 2, 3]
    result = merge([2, 2], [1, 1, 3])
    assert_equal(expected, result)
  end
  
  def test_4
    # skip
    expected = [1, 4, 5]
    result = merge([], [1, 4, 5])
    assert_equal(expected, result)
  end
  
  def test_5
    # skip
    expected = [1, 4, 5]
    result = merge([1, 4, 5], [])
    assert_equal(expected, result)
  end

  def test_6
    # skip
    expected = [1, 2, 2, 3, 3, 4, 7, 9]
    result = merge([1, 2, 3], [2, 3, 4, 7, 9])
    assert_equal(expected, result)
  end
  
end

class SeventhExerciseLS < Minitest::Test

=begin
this is the LS solution with some modifications to allow
for smaller sized arrays to be the first argument.  The LS
solution was far simpler than mine.  I had too much code, we
both understood the need to compare one element from each array
at one time, but the LS algorithm was much better.

take the two arrays [1, 5, 9] and [2, 4, 8] we take the first
value from the first array which is 1 smaller_idx = 0 < size of smaller
array but 2 is not <= 1 so the while loop does not get executed, so
result gets 1 pushed onto it.  Now we go to the next value which is 5
but 2 <= 5 so, 2 gets pushed onto result, we increment smaller_idx and
go to the next value which is 4, 4 is <= 5 so that gets pushed onto
result, then we push 5 onto result.  The nex value is 9 but 8 <= 9
so that gets pushed onto the result followed by 9.
=end

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

  def test_1
    # skip
    expected = [1, 2, 5, 6, 8, 9]
    result = merge([1, 5, 9], [2, 6, 8])
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = [1, 1, 2, 2, 3]
    result = merge([1, 1, 3], [2, 2])
    assert_equal(expected, result)
  end

  def test_3
    # skip
    expected = [1, 1, 2, 2, 3]
    result = merge([2, 2], [1, 1, 3])
    assert_equal(expected, result)
  end
  
  def test_4
    # skip
    expected = [1, 4, 5]
    result = merge([], [1, 4, 5])
    assert_equal(expected, result)
  end
  
  def test_5
    # skip
    expected = [1, 4, 5]
    result = merge([1, 4, 5], [])
    assert_equal(expected, result)
  end

  def test_6
    # skip
    expected = [1, 2, 2, 3, 3, 4, 7, 9]
    result = merge([1, 2, 3], [2, 3, 4, 7, 9])
    assert_equal(expected, result)
  end

  def test_7
    # skip
    expected = [1, 2, 4, 5, 8, 9]
    result = merge([1, 5, 9], [2, 4, 8])
    assert_equal(expected, result)
  end
  
  
end