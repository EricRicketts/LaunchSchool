require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class EighthExercise < Minitest::Test

=begin
Find The Duplicate

Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once),
how would you determine which value occurs twice? Write a method that will find and return the duplicate value that is known to be in the array.

Examples:

find_dup([1, 5, 3, 1]) == 1
find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

  - use #find.with_index
  - sort the array
    - if the array is sorted then the two like numbers
    should be adjacent to one another
    elem == ary[idx + 1] 
=end

  def find_dup(ary)
    sorted_ary = ary.sort
    sorted_ary.find.with_index {|elem, idx| elem == sorted_ary[idx + 1]}       
  end

  def test_1
    # skip
    ary = [1, 5, 3, 1]
    assert_equal(1, find_dup(ary))
  end
  
  def test_2
    # skip
    ary = [18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
      38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
      14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
      78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
      89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
      41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
      55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
      85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
      40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
      7,  34, 57, 74, 45, 11, 88, 67,  5, 58]

    assert_equal(73, find_dup(ary))
  end
  
end

class EighthExerciseLS < Minitest::Test

=begin
this is a much better solution because the array does
not need to be sorted
=end

  def find_dup(ary)
    ary.find {|elem| ary.count(elem) == 2}       
  end

  def test_1
    # skip
    ary = [1, 5, 3, 1]
    assert_equal(1, find_dup(ary))
  end
  
  def test_2
    # skip
    ary = [18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
      38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
      14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
      78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
      89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
      41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
      55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
      85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
      40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
      7,  34, 57, 74, 45, 11, 88, 67,  5, 58]

    assert_equal(73, find_dup(ary))
  end   
  
end