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

AL:
  - so if the program starts with a ")" exit false
  - start with a count = 0
    - split the string
    - for each char increase count by 1 if "("
    - for each char if ")" decrease count by 1
    - count == 0
=end

class FourthExercise < Minitest::Test

  def balanced?(str)
    count = 0
    words = str.split
    words.each do |word|
      word.chars.each do |char|
        return false if count.zero? && char == ")"
        if char == "("
          count += 1
        elsif char == ")"
          count -= 1
        end
      end
    end
    count.zero?
  end

  def test_0
    # skip
    assert(balanced?('What (is) this?'))
  end

  def test_1
    # skip
    refute(balanced?('What is) this?'))
  end

  def test_2
    # skip
    refute(balanced?('What (is this?'))
  end

  def test_3
    # skip
    assert(balanced?('((What) (is this))?'))
  end

  def test_4
    # skip
    refute(balanced?('((What)) (is this))?'))
  end

  def test_5
    # skip
    assert(balanced?('Hey!'))
  end

  def test_6
    # skip
    refute(balanced?(')Hey!('))
  end

  def test_7
    # skip
    refute(balanced?('What ((is))) up('))
  end

end

class FourthExerciseLS < Minitest::Test
=begin
this is a cleaner more robust solution than what I have, the more
general case for leading with ")" is if count falls below zero.
Very good.  This catches anytime a ")" leads in the attempt to
match opening and closing parentheses
=end

  def balanced?(str)
    count = 0
    str.chars.each do |char|
      count += 1 if char == "("
      count -= 1 if char == ")"
      break if count < 0
    end
    count.zero?
  end

  def test_0
    # skip
    assert(balanced?('What (is) this?'))
  end

  def test_1
    # skip
    refute(balanced?('What is) this?'))
  end

  def test_2
    # skip
    refute(balanced?('What (is this?'))
  end

  def test_3
    # skip
    assert(balanced?('((What) (is this))?'))
  end

  def test_4
    # skip
    refute(balanced?('((What)) (is this))?'))
  end

  def test_5
    # skip
    assert(balanced?('Hey!'))
  end

  def test_6
    # skip
    refute(balanced?(')Hey!('))
  end

  def test_7
    # skip
    refute(balanced?('What ((is))) up('))
  end

end