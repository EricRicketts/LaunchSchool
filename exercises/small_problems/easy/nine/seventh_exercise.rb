require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Name Swapping

Write a method that takes a first name, a space,
and a last name passed as a single String argument,
and returns a string that contains the last name,
a comma, a space, and the first name.

Examples

swap_name('Joe Roberts') == 'Roberts, Joe'
=end

class SeventhExercise < Minitest::Test

  # same as the LS solution
  def swap_name(str)
    str.split.reverse.join(", ")
  end

  def test_0
    assert_equal('Roberts, Joe', swap_name('Joe Roberts'))
  end

end