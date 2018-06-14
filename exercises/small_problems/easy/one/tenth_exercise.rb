require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class TenthExercise < Minitest::Test

=begin
What's My Bonus

Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary.
If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.

Examples:

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
The tests above should print true.

Input: 2 arguments
  - 1st is guaranteed to be a + int
  - 2nd is guaranteed to be a boolean

Algorithm:
  - Assign a default value for both 1000 for salary, true for bonus
  - if true bonus = salary / 2 else bonus = 0
=end

  def calculate_bonus(salary=1000, got_bonus=true)
    got_bonus ? salary / 2 : 0
  end

  def test_one
    assert_equal(1400, calculate_bonus(2800, true))
  end

  def test_two
    assert_equal(0, calculate_bonus(1000, false))
  end

  def test_three
    assert_equal(25000, calculate_bonus(50000, true))
  end

end