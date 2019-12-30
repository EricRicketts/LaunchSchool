require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Lettercase Percentage Ratio

In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters,
as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of
characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters,
and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

Examples

letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

AL:
  - split the string into chars
  - count all of the chars
  - lower & (total - string count lower) / total * 100 round 2
  - upper (total - string count upper) / total * 100 round 2
  - neither = 100 - lower - upper
=end

class ThirdExercise < Minitest::Test

  def letter_percentages(str)
    hsh = {}
    total_chars = str.size
    hsh[:uppercase] = (str.count('A-Z') / total_chars.to_f)*100.round(2)
    hsh[:lowercase] = (str.count('a-z') / total_chars.to_f)*100.round(2)
    hsh[:neither] = 100.00 - hsh[:uppercase] - hsh[:lowercase]
    hsh
  end

  def test_0
    # skip
    assert_equal({ lowercase: 50.0, uppercase: 10.0, neither: 40.0 }, letter_percentages('abCdef 123'))
  end
  
  def test_1
    # skip
    assert_equal({ lowercase: 37.5, uppercase: 37.5, neither: 25.0 }, letter_percentages('AbCd +Ef'))
  end
  
  def test_2
    # skip
    assert_equal({ lowercase: 0, uppercase: 0, neither: 100 }, letter_percentages('123'))
  end
  
end