require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class NinthExercise < Minitest::Test

=begin
Bubble Sort
Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm,
but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array. On each pass,
each pair of consecutive elements is compared. If the first of the two elements is greater than the second,
then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps;
at that point, the Array is completely sorted.

6 2 7 1 4 Start: compare 6 > 2? Yes
2 6 7 1 4 Exchange
2 6 7 1 4 6 > 7? No (no exchange)
2 6 7 1 4 7 > 1? Yes
2 6 1 7 4 Exchange
2 6 1 7 4 7 > 4? Yes
2 6 1 4 7 Exchange

-- 1st Run Complete

2 6 1 4 7 2 > 6? No
2 6 1 4 7 6 > 1? Yes
2 1 6 4 7 Exchange
2 1 6 4 7 6 > 4? Yes
2 1 4 6 7 Exchange
2 1 4 6 7 6 > 7? No

-- 2nd Run Complete

2 1 4 6 7 2 > 1? Yes
1 2 4 6 7 Exchange
1 2 4 6 7 2 > 4? No
1 2 4 6 7 4 > 6? No
1 2 4 6 7 6 > 7? No

-- 3rd Run Complete

1 2 4 6 7 1 > 2? No
1 2 4 6 7 2 > 4? No
1 2 4 6 7 4 > 6? No
1 2 4 6 7 6 > 7? No
1 2 4 6 7 No swaps; all done; sorted

-- 4th Run Complete

We can stop iterating the first time we make a pass through the array without making any swaps; at that point,
the entire Array is sorted.

For further information, including pseudo-code that demonstrates the algorithm as well as a minor optimization technique,
see the Bubble Sort wikipedia page.

Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described.
Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the
Array contains at least 2 elements.

AL:
  - we need to compare two numbers at a time
    - if the second is bigger than the first then swap
    - regardless if there is a swap then we need to advance to the next two numbers
    - for an array of four numbers the indices are [0, 1, 2, 3]
    - number pairs are:
      - [0, 1]
      - [1, 2]
      - [2, 3]
    - need a swap count variable if swap_count == 0 then the loop is done

    - outer loop

      - inner loop
        - start with index = 0
=end

  def bubble_sort!(arr)
    last_index = arr.length - 1
    loop do
      swap_count = 0
      index = 0 
      loop do
        if arr[index] > arr[index + 1]
          arr[index], arr[index + 1] = arr[index + 1], arr[index]
          swap_count += 1
        end
        index += 1
        break if index >= last_index
      end
      break if swap_count.zero?
    end
    arr
  end

  def test_0
    # skip
    arr = [5, 3]
    expected = [3, 5]
    bubble_sort!(arr)
    assert_equal(expected, arr)
  end
  
  def test_1
    # skip
    arr = [6, 2, 7, 1, 4]
    expected = [1, 2, 4, 6, 7]
    bubble_sort!(arr)
    assert_equal(expected, arr)
  end
  
  def test_2
    # skip
    arr = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
    expected = %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
    bubble_sort!(arr)
    assert_equal(expected, arr)
  end
  
end