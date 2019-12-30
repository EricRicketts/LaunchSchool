=begin
Staggered Caps (Part 2)

Modify the method from the previous exercise so it ignores non-alphabetic
characters when determining whether it should uppercase or lowercase each
letter. The non-alphabetic characters should still be included in the return;
they just don't count when toggling the desired case.

Example:

staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

AL:
  - have a loop which progresses through all of the characters
  - initialize needs_upcase to true
  - initialize alpha_char_count to 0
  - examine a character
    - if the character is an alpha and the alpha_char_count is even
      upcase it and increment alpha_char_count
    - if the character is an alpha and the alpha_char_count is odd
      downcase it and increment alpha_char_count
    - else do nothing
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class SixthExercise < Minitest::Test

  def staggered_case(str)
    result = ''
    last_index = str.length - 1
    alpha_char_count = 0
    0.upto(last_index) do |idx|
      if str[idx].match?(/[[:alpha:]]/)
        result += (alpha_char_count.even? ? str[idx].upcase : str[idx].downcase)
        alpha_char_count += 1
      else
        result += str[idx]
      end
    end
    result    
  end  

  def test_1
    # skip
    expected = 'I lOvE lAuNcH sChOoL!'
    result = staggered_case('I Love Launch School!')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = 'AlL cApS'
    result = staggered_case('ALL CAPS')
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = 'IgNoRe 77 ThE 444 nUmBeRs'
    result = staggered_case('ignore 77 the 444 numbers')
    assert_equal(expected, result)
  end
  
end

require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class SixthExerciseLS < Minitest::Test
=begin
LS followed the same format as the last
problem however, the solution depends on
embedded conditionals, I generally do not
like embedded conditionals, but their solution
does eliminate the need for a count variable
=end
  def staggered_case(str)
    result = ''
    last_index = str.length - 1
    needs_upcase = true    
    0.upto(last_index) do |idx|
      if str[idx].match?(/[[:alpha:]]/)
        if needs_upcase
          result += str[idx].upcase
        else
          result += str[idx].downcase    
        end
        needs_upcase = !needs_upcase
      else
        result += str[idx]
      end
    end
    result    
  end  

  def test_1
    # skip
    expected = 'I lOvE lAuNcH sChOoL!'
    result = staggered_case('I Love Launch School!')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = 'AlL cApS'
    result = staggered_case('ALL CAPS')
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = 'IgNoRe 77 ThE 444 nUmBeRs'
    result = staggered_case('ignore 77 the 444 numbers')
    assert_equal(expected, result)
  end
  
end

class SixthExerciseFurtherExploration < Minitest::Test
=begin
AL:
  - result = ''
  - needs_update flag initialized to true
  - last_index = str.length - 1
  - loop 0 to last_index
    - if count_all_chars = true
      - call update char on every iteration
    - else
      - call update char on every letter
=end

  def staggered_case(str, count_all_chars: true)
    result = ''
    needs_update = true
    last_index = str.length - 1
    0.upto(last_index) do |idx|
      if count_all_chars
        char, needs_update = update_char(str, idx, needs_update)
        result += char
      else
        if str[idx].match?(/[[:alpha:]]/)
          char, needs_update = update_char(str, idx, needs_update)
          result += char
        else
          result += str[idx]
        end
      end
    end
    result
  end

  def update_char(str, idx, needs_update)
    if needs_update
      char = str[idx].upcase
    else
      char = str[idx].downcase
    end
    [char, !needs_update]
  end

  def test_1
    # skip
    expected = 'I LoVe lAuNcH ScHoOl!'
    result = staggered_case('I Love Launch School!')
    assert_equal(expected, result)
  end

  def test_2
    # skip
    expected = 'I lOvE lAuNcH sChOoL!'
    result = staggered_case('I Love Launch School!', count_all_chars: false)
    assert_equal(expected, result)    
  end
  
  def test_3
    # skip
    expected = 'AlL CaPs'
    result = staggered_case('ALL CAPS')
    assert_equal(expected, result)
  end
  
  def test_4
    # skip
    expected = 'IgNoRe 77 ThE 444 nUmBeRs'
    result = staggered_case('ignore 77 the 444 numbers', count_all_chars: false)
    assert_equal(expected, result)
  end  
  
end