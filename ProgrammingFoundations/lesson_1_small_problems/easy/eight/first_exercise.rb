=begin
Sum Of Sums

Write a method that takes an Array of numbers and then returns the
sum of the sums of each leading subsequence for that Array.
You may assume that the Array always contains at least one number.

Examples:

sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35

I: array always has at least one number
O: integer

AL:
  - set sum = 0
  - loop through the indices of the array
  - for each index sum the array array[0..indx]
  - add this value to sum
  - return sum
=end
require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FirstExercise < Minitest::Test

  def sum_of_sums(array)
    sum = 0
    last_index = array.length - 1
    0.upto(last_index) do |idx|
     sum += array[0..idx].sum
    end 
    sum  
  end

  def test_1
    # skip
    assert_equal(21, sum_of_sums([3, 5, 2]))
  end
  
  def test_2
    # skip
    assert_equal(36, sum_of_sums([1, 5, 7, 3]))
  end
  
  def test_3
    # skip
    assert_equal(4, sum_of_sums([4]))
  end
  
  def test_4
    # skip
    assert_equal(35, sum_of_sums((1..5).to_a))
  end
  
end

class FirstExerciseAltSol < Minitest::Test

  def sum_of_sums(array)
    array.each.with_index.inject(0) {|sum, (e, idx)| sum += array[0..idx].sum }
  end

  def test_1
    # skip
    assert_equal(21, sum_of_sums([3, 5, 2]))
  end
  
  def test_2
    # skip
    assert_equal(36, sum_of_sums([1, 5, 7, 3]))
  end
  
  def test_3
    # skip
    assert_equal(4, sum_of_sums([4]))
  end
  
  def test_4
    # skip
    assert_equal(35, sum_of_sums((1..5).to_a))
  end
  
end

class FirstExerciseLS < Minitest::Test
=begin
I like mine a bit better but the same concept,
incrementally add the number of elements.
=end

  def sum_of_sums(array)
    sum = 0
    array_length = array.length
    1.upto(array_length) do |number_of_elements|
      sum += array.slice(0, number_of_elements).sum
    end
    sum
  end

  def test_1
    # skip
    assert_equal(21, sum_of_sums([3, 5, 2]))
  end
  
  def test_2
    # skip
    assert_equal(36, sum_of_sums([1, 5, 7, 3]))
  end
  
  def test_3
    # skip
    assert_equal(4, sum_of_sums([4]))
  end
  
  def test_4
    # skip
    assert_equal(35, sum_of_sums((1..5).to_a))
  end
  
end
