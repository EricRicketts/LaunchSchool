require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Diamond Of Stars:

Write a function that takes an integer number as input, and prints out a diamond with the "*" character
whose width is the number n.

For example:

Given n = 3

 *
* *
 *
 
Given n = 5

  *
 * *
*   *
 * *
  *

Given n = 7

line 1: was 1 stars: 3 lead spaces, 1 star
line 2: was 3 stars: 2 lead spaces, 1 star, 1 inter spaces, 1 star
line 3: was 5 stars: 1 lead spaces, 1 star, 3 inter spaces, 1 star
line 4: was 7 stars: 0 lead spaces, 1 star, 5 inter spaces, 1 star
   *
  * *
 *   *
*     *
 *   *
  * *
   *

stars =        [1, 3, 5, 7, 5, 3, 1]
lead spaces =  [3, 2, 1, 0, 1, 2, 3]
inter spaces = [0, 1, 3, 5, 3, 1, 0]
have a special case for 1 if 1 just 3 lead spaces + 1 start
iterate through the stars array and use reduce to build the string
using the special case for 1 start

inputs: just a number, based on the last exercise guaranteed odd?
outputs: string or array of strings

data structure:
1.  chose a string, since puts string is so easy
2.  Also each line should be easy via a concatenate operation

algorithm
- leading spaces, one star, intermediate spaces, one start, "\n"

=end

class HollowDiamondTest < Minitest::Test

  def hollow_diamond_of_stars(odd_num)
    stars_ary = (1..odd_num).step(2).to_a + (1...odd_num).step(2).to_a.reverse
    init_lead_spaces = (odd_num - 1) / 2
    lead_space_ary = init_lead_spaces.downto(0).to_a + 1.upto(init_lead_spaces).to_a
    inter_space_ary = (1..(odd_num - 2)).step(2).to_a + (1..(odd_num - 4)).step(2).to_a.reverse
    inter_space_ary.unshift(0).push(0)

    stars_ary.each.with_index.inject('') do |pattern, (num_stars, index)|
      pattern_prefix = "\s"*lead_space_ary[index] + "*"
      # () needed below because without them Ruby thinks pattern_prefix + num_stars no implicit
      # conversion of integer into a string
      pattern += pattern_prefix + (num_stars == 1 ? "\n" : "\s"*inter_space_ary[index] + "*" + "\n")
    end
  end


  def test_diamond_stars_3
    expected = "\s*\n* *\n\s*\n"
    assert_equal(expected, hollow_diamond_of_stars(3))
  end

  def test_diamond_stars_5
    expected = "\s\s*\n\s* *\n*   *\n\s* *\n\s\s*\n"
    assert_equal(expected, hollow_diamond_of_stars(5))
  end

  def test_diamond_stars_7
    expected = "\s\s\s*\n\s\s* *\n\s*   *\n*     *\n\s*   *\n\s\s* *\n\s\s\s*\n"
    assert_equal(expected, hollow_diamond_of_stars(7))
  end

end