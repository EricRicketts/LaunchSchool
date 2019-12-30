# Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and returns the same string
# with every 4th character in a word upcase. Other characters should remain the same.


# p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'LorEm IpsUm is simPly dumMy texT of the priNtinG'
# p to_weird_case('It is a long established fact that a reader will be distracted') == 'It is a lonG estAbliShed facT thaT a reaDer wilL be disTracTed'
# p to_weird_case('aaA bB c') == 'aaA bB c'
# p to_weird_case('Merry Poppins word is supercalifragilisticexpialidocious') == 'MerRy PopPins worD is supErcaLifrAgilIstiCexpIaliDociOus'

=begin
I: string
O: string

AL:
  - split on spaces to get words
  - for each word
    - split into chars
    - if chars >= 4
      - upcase every fourth char
      - join the chars into a word
      - return the word
    else return word
=end
require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class Session3Test < Minitest::Test

  def to_weird_case(str)
    str.split(/\s+/).map do |word|
      if word.length >= 4
        word.chars.map.with_index do |letter, idx|
          ((idx + 1) % 4).zero? ? letter.upcase : letter
        end.join
      else
        word
      end
    end.join(" ")
  end

  def test_1
    expected = 'LorEm IpsUm is simPly dumMy texT of the priNtinG'
    result = to_weird_case('Lorem Ipsum is simply dummy text of the printing')
    assert_equal(expected, result)
  end
  
  def test_2
    expected = 'It is a lonG estAbliShed facT thaT a reaDer wilL be disTracTed'
    result = to_weird_case('It is a long established fact that a reader will be distracted')
    assert_equal(expected, result)
  end
  
  def test_3
    expected = 'aaA bB c'
    result = to_weird_case('aaA bB c')
    assert_equal(expected, result)
  end
  
  def test_4
    expected = 'MerRy PopPins worD is supErcaLifrAgilIstiCexpIaliDociOus'
    result = to_weird_case('Merry Poppins word is supercalifragilisticexpialidocious')
    assert_equal(expected, result)
  end
  
end