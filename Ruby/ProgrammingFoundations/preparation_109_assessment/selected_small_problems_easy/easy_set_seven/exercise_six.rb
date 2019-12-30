require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Staggered Caps (Part 2)

Modify the method from the previous exercise so it ignores non-alphabetic characters when determining
whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be
included in the return value; they just don't count when toggling the desired case.

Example:

staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

AL:
  - set make_upcase = true
  - iterate through the string
    - if the letter is alphabetic
    - if make upcase is true upcase the letter else downcase the letter
    - toggle make_upcase

=end

class ExerciseSix < Minitest::Test

  def staggered_case(str)
    make_upcase = true
    result = ''
    str.chars.each do |char|
      if char.match?(/[[:alpha:]]/)
        result << (make_upcase ? char.upcase : char.downcase)
        make_upcase = !make_upcase
      else
        result << char
      end
    end
    result
  end

  def test_0
    # skip
    assert_equal('I lOvE lAuNcH sChOoL!', staggered_case('I Love Launch School!'))
  end
  
  def test_1
    # skip
    assert_equal('AlL cApS', staggered_case('ALL CAPS'))
  end
  
  def test_2
    # skip
    assert_equal('IgNoRe 77 ThE 444 nUmBeRs', staggered_case('ignore 77 the 444 numbers'))
  end
  
end

class ExerciseSixAlternateSolution < Minitest::Test

=begin
AL:
  - initial
  - if count_all is true
    - if make_upcase is true then upcase if not downcase
    - toggle upcase
  - if count all is false then
    - check if letter is alphabetic
      - if so then if make_upcase is true, letter.upcase : letter.downcase
      - push letter onto string
    - else
      - push letter onto string
=end

  def change_case_and_toggle_case(str, char, make_upcase)
    str << (make_upcase ? char.upcase : char.downcase)
    [str, !make_upcase]   
  end

  def staggered_case(str, count_all = true)
    make_upcase = true
    result = ''

    str.chars.each do |char|
      if count_all
        result, make_upcase = change_case_and_toggle_case(result, char, make_upcase)
      else
        if char.match?(/[[:alpha:]]/)
          result, make_upcase = change_case_and_toggle_case(result, char, make_upcase)
        else
          result << char
        end        
      end
    end
    result
  end

  def test_0
    # skip
    assert_equal('I lOvE lAuNcH sChOoL!', staggered_case('I Love Launch School!', count_all = false))
  end

  def test_1
    # skip
    assert_equal('I LoVe lAuNcH ScHoOl!', staggered_case('I Love Launch School!'))
  end
  
  def test_2
    # skip
    assert_equal('AlL cApS', staggered_case('ALL CAPS', count_all = false))
  end

  def test_3
    # skip
    assert_equal('AlL_CaPs', staggered_case('ALL_CAPS'))
  end
  
  def test_4
    # skip
    assert_equal('IgNoRe 77 ThE 444 nUmBeRs', staggered_case('ignore 77 the 444 numbers', count_all = false))
  end

  def test_5
    # skip
    assert_equal('IgNoRe 77 ThE 444 NuMbErS', staggered_case('ignore 77 the 444 numbers'))
  end
  
end