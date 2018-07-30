require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class SubstringsFirstSolution < Minitest::Test

=begin
I: string, say 'palin'
O: array of strings which are substrings of the original string
AL:
  - we need two loops
  - in the first loop start at character index = current index
    in this case index[0] = 'p'
    - in the inner loop move from the starting index one character
    at a time to create new substrings
    - in this case the first iteration would be [0..0] = 'p'
    - the second iteration would be [0..1] = 'pa'


  - if we have a minimum substring size then we need a pattern like
    the following:
  - if the minimum subsring size is 2 then we start with a substring
    which is [0..1] or current idx + offset the offset is going to be
    mininum substring size - 1
  - so with a minimum substring size of 2 we will have the following
    indices for the first loop
      - str[0..1] = 'pa'
      - str[0..2] = 'pal'
      - str[0..3] = 'pali'
      - str[0..4] = 'palin'
  - but we need a guard condition for the last substrings
    - in the case of 'palin' we move to index = 3 which is 'i'
      and the only substring is 'in' so it is str[3..4] thus
      when current index + offset <= last_index we are ok
=end


  def substrings(min_substr_size = 1, string)
    substrs, last_index = [], string.size - 1
    offset = min_substr_size - 1
    string.chars.each.with_index do |char, index|
      index.upto(last_index) do |idx|
        if idx + offset <= last_index
          substrs.push(string[index..idx + offset])
        end
      end
    end
    substrs
  end

  def test_1
    # skip
    expected = [
      'p', 'pa', 'pal', 'pali', 'palin',
      'a', 'al', 'ali', 'alin',
      'l', 'li', 'lin',
      'i', 'in',
      'n'
    ]
    assert_equal(expected, substrings('palin'))
  end

  def test_2
    # skip
    expected = [
      'pa', 'pal', 'pali', 'palin',
      'al', 'ali', 'alin',
      'li', 'lin',
      'in'
    ]
    assert_equal(expected, substrings(min_substr_size = 2, 'palin'))
  end

  def test_3
    # skip
    expected = [
      'pal', 'pali', 'palin',
      'ali', 'alin',
      'lin'
    ]
    assert_equal(expected, substrings(min_substr_size = 3, 'palin'))
  end

  def test_4
    # skip
    expected = ['pali', 'palin', 'alin']
    assert_equal(expected, substrings(min_substr_size = 4, 'palin'))
  end

  def test_5
    # skip
    expected = ['palin']
    assert_equal(expected, substrings(min_substr_size = 5, 'palin'))
  end

end
