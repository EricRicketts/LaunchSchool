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
***
 *
 
Given n = 5

  *
 ***
*****
 ***
  *

Input: number
1.  Can the input be 0?
2.  What about even input?
3.  Assume input cannot be < 0

Output:
1.  Return a string with newline "\n" delimiters OR
2.  Just print to the screen

Modeling the problem:
1.  given an odd number, 5 for example
2.  output 5 strings:
    a.  1 star, 3 stars, 5 stars, 3 stars, 1 star
    b.  prepend the stars with 2 spaces, 1 space, 0 spaces, 1 space, 2 spaces
3.  suffix each string with "\n" or print out each string
=end

class DiamondTest < Minitest::Test

  def diamond_of_stars(odd_num)
    arr = (1..odd_num).step(2).to_a + (1...odd_num).step(2).to_a.reverse
    arr.inject("") {|pattern, odd_int|  pattern += "\s"*((odd_num - odd_int)/2) + "*"*odd_int + "\n"}
  end

  def test_diamond_stars_3
    expected = "\s*\n***\n\s*\n"
    assert_equal(expected, diamond_of_stars(3))
  end

  def test_diamond_stars_5
    expected = "\s\s*\n\s***\n*****\n\s***\n\s\s*\n"
    assert_equal(expected, diamond_of_stars(5))
  end

  def test_diamond_stars_7
    expected = "\s\s\s*\n\s\s***\n\s*****\n*******\n\s*****\n\s\s***\n\s\s\s*\n"
    assert_equal(expected, diamond_of_stars(7))
  end

end