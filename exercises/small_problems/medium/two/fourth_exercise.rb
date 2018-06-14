require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Matching Parentheses?
Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced,
false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

Examples:

balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false

Note that balanced pairs must each start with a (, not a ).
=end

class FourthExercise < Minitest::Test


  def test_0
    skip
    assert(balanced?('What (is) this?'))
  end

  def test_1
    skip
    refute(balanced?('What is) this?'))
  end

  def test_2
    skip
    refute(balanced?('What (is this?'))
  end

  def test_3
    skip
    assert(balanced?('((What) (is this))?'))
  end

  def test_4
    skip
    refute(balanced?('((What)) (is this))?'))
  end

  def test_5
    skip
    assert(balanced?('Hey!'))
  end

  def test_6
    skip
    refute(balanced?(')Hey!('))
  end

  def test_7
    skip
    refute(balanced?('What ((is))) up('))
  end

end