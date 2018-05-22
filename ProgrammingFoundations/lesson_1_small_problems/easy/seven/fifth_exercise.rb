=begin
Staggered Caps (Part 1)

Write a method that takes a String as an argument, and returns a new String
that contains the original value using a staggered capitalization scheme in
which every other character is capitalized, and the remaining characters are
lowercase. Characters that are not letters should not be changed, but count
as characters when switching between upper and lowercase.

Example:

staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

AL:
  - in the last example index 0, 2, 4, .., are upcased
  - the odds are downcased
  - if the index is even AND it is a letter then upcase
  - if the index is odd AND it is a letter then downcase
  - else return the letter
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'


class FifthExercise < Minitest::Test

  def staggered_case(str)
    str.chars.map.with_index do |char, idx|
      if idx.even? && char.match?(/[[:lower:]]/)
        char.upcase
      elsif idx.odd? && char.match?(/[[:upper:]]/)
        char.downcase
      else
        char
      end
    end.join
  end

  def test_1
    # skip
    expected = 'I LoVe lAuNcH ScHoOl!'
    result = staggered_case('I Love Launch School!')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = 'AlL_CaPs'
    result = staggered_case('ALL_CAPS')
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = 'IgNoRe 77 ThE 444 NuMbErS'
    result = staggered_case('ignore 77 the 444 numbers')
    assert_equal(expected, result)
  end
  
end

class FifthExerciseAlternate < Minitest::Test

  def staggered_case(str)
    last_index = str.length - 1
    0.upto(last_index) do |idx|
      if idx.even? && str[idx].match?(/[[:lower:]]/)
        str[idx] = str[idx].upcase
      elsif idx.odd? && str[idx].match?(/[[:upper:]]/)
        str[idx] = str[idx].downcase
      end
    end
    str    
  end  

  def test_1
    # skip
    expected = 'I LoVe lAuNcH ScHoOl!'
    result = staggered_case('I Love Launch School!')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = 'AlL_CaPs'
    result = staggered_case('ALL_CAPS')
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = 'IgNoRe 77 ThE 444 NuMbErS'
    result = staggered_case('ignore 77 the 444 numbers')
    assert_equal(expected, result)
  end
    
end

class FifthExerciseLS < Minitest::Test

=begin
I like the LS solution much better because it
is simpler, they came up with the algorithm the
way they did because String#upcase and String#downcase
only change characters that need to be upcased or
downcased, otherwise they just return the original
character
=end

  def staggered_case(str)
    result = ''
    need_upcase = true
    last_index = str.length - 1
    0.upto(last_index) do |idx|
      if need_upcase
        result += str[idx].upcase
      else
        result += str[idx].downcase
      end
      need_upcase = !need_upcase
    end
    result
  end  

  def test_1
    # skip
    expected = 'I LoVe lAuNcH ScHoOl!'
    result = staggered_case('I Love Launch School!')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = 'AlL_CaPs'
    result = staggered_case('ALL_CAPS')
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = 'IgNoRe 77 ThE 444 NuMbErS'
    result = staggered_case('ignore 77 the 444 numbers')
    assert_equal(expected, result)
  end
    
end

class FifthExerciseFurtherExploration < Minitest::Test

=begin
Further Exploration

Modify this method so the caller can request that the first character
be downcased rather than upcased? If the first character is downcased,
then the second character should be upcased, and so on.

Hint: Use a keyword argument.
=end

  def staggered_case(str, first_char_upcase: true)
    result = ''
    need_upcase = first_char_upcase ? true : false
    last_index = str.length - 1
    0.upto(last_index) do |idx|
      if need_upcase
        result += str[idx].upcase
      else
        result += str[idx].downcase
      end
      need_upcase = !need_upcase
    end
    result
  end  

  def test_1
    # skip
    expected = 'I LoVe lAuNcH ScHoOl!'
    result = staggered_case('I Love Launch School!')
    assert_equal(expected, result)
  end

  def test_2
    # skip
    expected = 'i lOvE LaUnCh sChOoL!'
    expected = staggered_case('I Love Launch School!', first_char_upcase: false)
  end
  
  def test_3
    # skip
    expected = 'AlL_CaPs'
    result = staggered_case('ALL_CAPS')
    assert_equal(expected, result)
  end
  
  def test_4
    # skip
    expected = 'iGnOrE 77 tHe 444 nUmBeRs'
    result = staggered_case('ignore 77 the 444 numbers', first_char_upcase: false)
    assert_equal(expected, result)
  end
    
end