require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class SecondExercise < Minitest::Test

=begin
Letter Case Counter

Write a method that takes a string, and then returns a hash that contains 3 entries:
one represents the number of characters in the string that are lowercase letters,
one the number of characters that are uppercase letters, and one the number of characters that are neither.

Examples

letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
AL:
  - initialize the Hash.new(0) to we have 0 as a value
  to start with
  - simply examine each character
    - if upper increment upper
    - of lower increment lower
    - if neither increment neither
=end

  def letter_case_count(str)
    hsh = Hash[:uppercase, 0, :lowercase, 0, :neither, 0]
    str.chars.each do |char|
      case char
      when /[[:upper:]]/
        hsh[:uppercase] += 1
      when /[[:lower:]]/
        hsh[:lowercase] += 1
      else
        hsh[:neither] += 1
      end
    end
    hsh
  end

  def test_1
    # skip
    expected = { lowercase: 5, uppercase: 1, neither: 4 }
    result = letter_case_count('abCdef 123')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = { lowercase: 3, uppercase: 3, neither: 2 }
    result = letter_case_count('AbCd +Ef')
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = { lowercase: 0, uppercase: 0, neither: 3 }
    result = letter_case_count('123')
    assert_equal(expected, result)
  end
  
  def test_4
    # skip
    expected = { lowercase: 0, uppercase: 0, neither: 0 }
    result = letter_case_count('')
    assert_equal(expected, result)
  end
  
end

class SecondExerciseLS < Minitest::Test

=begin
I like my solution better but I like the use
of count
=end

  def letter_case_count(string)
    counts = {}
    characters = string.chars
    counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
    counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
    counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
    counts
  end

  def test_1
    # skip
    expected = { lowercase: 5, uppercase: 1, neither: 4 }
    result = letter_case_count('abCdef 123')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = { lowercase: 3, uppercase: 3, neither: 2 }
    result = letter_case_count('AbCd +Ef')
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = { lowercase: 0, uppercase: 0, neither: 3 }
    result = letter_case_count('123')
    assert_equal(expected, result)
  end
  
  def test_4
    # skip
    expected = { lowercase: 0, uppercase: 0, neither: 0 }
    result = letter_case_count('')
    assert_equal(expected, result)
  end

end