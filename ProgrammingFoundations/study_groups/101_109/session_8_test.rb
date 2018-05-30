require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

# implement a function that calculates the sum of the integers inside a string.
# For example, in the string "The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog",
# the sum of the integers is 3635.

# Note: only positive integers will be tested.

=begin
AL:
  - select from the string all digits which are grouped together
  - perfect use of scan function
  - as you select them covnert to integer with :to_i
  - then sum up the numbers

=end

class Session8TestFirstProblem < Minitest::Test

  def sum_of_integers(str)
    str.scan(/[[:digit:]]+/).map(&:to_i).sum      
  end

  def test_0
    expected = 3635
    str = "The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog"
    result = sum_of_integers(str)
    assert_equal(expected, result)
  end

end

# return the count of pairs that have consecutive numbers as follows:

# For array [1,2,5,8,-4,-3,7,6,5]

# The pairs are selected as follows [(1,2),(5,8),(-4,-3),(7,6),5]
# --the first pair is (1,2) and the numbers in the pair are consecutive; Count = 1
# --the second pair is (5,8) and are not consecutive
# --the third pair is (-4,-3), consecutive. Count = 2
# --the fourth pair is (7,6), also consecutive. Count = 3.
# --the last digit has no pair, so we ignore.

# p pairs([1,2,5,8,-4,-3,7,6,5]) == 3
=begin
  - produce a new array with all of the elements paired with one another
  while idx < last_index
    pairs.push(ary[idx, 2])
    idx += 2
  end
  sum = 0
  add to sum if (num1 - num2).abs == 1
=end

class Session8TestSecondProblem < Minitest::Test

  def pairs(arr)
    last_index = arr.length - 1
    idx = 0
    pairs = []
    sum = 0
    while idx < last_index
      pairs.push(arr[idx, 2])
      idx += 2
    end
    pairs.each do |pair|
      if (pair.first - pair.last).abs == 1
        sum += 1
      end
    end
    sum
  end

  def test_0
    expected = 3
    result = pairs([1,2,5,8,-4,-3,7,6,5])
    assert_equal(expected, result)
  end
  
end

class Session8TestSecondProblemAlternateSolution < Minitest::Test

  def pairs(arr)
    arr.each_slice(2).inject(0) {|sum, pair| (pair.first - pair.last).abs == 1 ? sum += 1 : sum }
  end

  def test_0
    expected = 3
    result = pairs([1,2,5,8,-4,-3,7,6,5])
    assert_equal(expected, result)
  end
  
end
