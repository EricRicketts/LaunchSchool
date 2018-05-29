=begin
Double Char (Part 2)

Write a method that takes a string, and returns a new string in which
every consonant character is doubled. Vowels (a,e,i,o,u), digits,
punctuation, and whitespace should not be doubled.

Examples:

double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

AL:
  - define a regex consisting of 
    - vowels
    - digits
    - punctuation
    - white space
  - if the char matches the regex return the char
  - else double the char


=end
require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class EighthExercise < Minitest::Test

  def double_consonants(string)
    consonants = ('a'..'z').to_a - %W(a e i o u).to_a
    string.chars.map {|char| consonants.include?(char.downcase) ? char*2 : char}.join
  end

  def test_1
    # skip
    expected = "SSttrrinngg"
    result = double_consonants('String')
  end
  
  def test_2
    # skip
    expected = "HHellllo-WWorrlldd!"
    result = double_consonants("Hello-World!")
  end
  
  def test_3
    # skip
    expected = "JJullyy 4tthh"
    result = double_consonants("July 4th")
  end
  
  def test_4
    # skip
    expected = ""
    result = double_consonants('')
  end
  
end

class EighthExerciseLS < Minitest::Test

  CONSONANTS = %W(b c d f g h j k l m n p q r s t v w x y z)

  def double_consonants(string)
    result = ''
    string.chars do |char|
      result << char << char if CONSONANTS.include?(char)
    end
    result
  end

  def test_1
    # skip
    expected = "SSttrrinngg"
    result = double_consonants('String')
  end
  
  def test_2
    # skip
    expected = "HHellllo-WWorrlldd!"
    result = double_consonants("Hello-World!")
  end
  
  def test_3
    # skip
    expected = "JJullyy 4tthh"
    result = double_consonants("July 4th")
  end
  
  def test_4
    # skip
    expected = ""
    result = double_consonants('')
  end
  
end

class EighthExerciseAlternateSolution < Minitest::Test
=begin
got this from Kyle Zhao, '&&' is allowed in regular
expressions in Ruby this is not a usual regular expression
construct
=end

  def double_consonants(string)
    string.gsub(/([a-z&&[^aeiou]])/, '\1\1')
  end

  def test_1
    # skip
    expected = "SSttrrinngg"
    result = double_consonants('String')
  end
  
  def test_2
    # skip
    expected = "HHellllo-WWorrlldd!"
    result = double_consonants("Hello-World!")
  end
  
  def test_3
    # skip
    expected = "JJullyy 4tthh"
    result = double_consonants("July 4th")
  end
  
  def test_4
    # skip
    expected = ""
    result = double_consonants('')
  end
  
end

class EighthExerciseMyAlternateSolutionOne < Minitest::Test
=begin
came up with this solution by experimentation, one must
remember that any regular expression engine marches down
the string character by character.  In this case it is
looking at 2 characters at a time, but the negative lookahead
is not consumable, so the return is always 0 characters in
width.  With 'String' the 
=end

  def double_consonants(string)
    string.gsub(/(?![AEIOUaeiou])([[:alpha:]])/, '\1\1')
  end

  def test_1
    # skip
    expected = "SSttrrinngg"
    result = double_consonants('String')
  end
  
  def test_2
    # skip
    expected = "HHellllo-WWorrlldd!"
    result = double_consonants("Hello-World!")
  end
  
  def test_3
    # skip
    expected = "JJullyy 4tthh"
    result = double_consonants("July 4th")
  end
  
  def test_4
    # skip
    expected = ""
    result = double_consonants('')
  end
  
end

class EighthExerciseMyAlternateSolutionTwo < Minitest::Test
=begin
came up with this solution by experimentation, one must
remember that any regular expression engine marches down
the string character by character.  The (?!pattern) is a
Negative Lookahead, so the regular expression engine
will not match an vowel and then it will match the following
character.  So as we march down the 'String' string, it
first sees
=end

  def double_consonants(string)
    string.gsub(/([[:alpha:]])(?<![AEIOUaeiou])/, '\1\1')
  end

  def test_1
    # skip
    expected = "SSttrrinngg"
    result = double_consonants('String')
  end
  
  def test_2
    # skip
    expected = "HHellllo-WWorrlldd!"
    result = double_consonants("Hello-World!")
  end
  
  def test_3
    # skip
    expected = "JJullyy 4tthh"
    result = double_consonants("July 4th")
  end
  
  def test_4
    # skip
    expected = ""
    result = double_consonants('')
  end
  
end