=begin
Swap Case

Write a method that takes a string as an argument and returns a new string
in which every uppercase letter is replaced by its lowercase version, and
every lowercase letter by its uppercase version. All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method.

Example:

swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

AL:
  - go through each letter
    - if lower make upper
      if upper make lower

    - split on every character
     char is [[:lower]] then upcase
     char is [[:upper]] then downcase
     else return char
    - then join
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FourthExercise < Minitest::Test

  def swapcase(str)
    str.chars.map do |char|
      case char
      when /[[:lower:]]/ then char.upcase
      when /[[:upper:]]/ then char.downcase
      else char  
      end
    end.join    
  end

  def test_1
    # skip
    assert_equal('cAMELcASE', swapcase('CamelCase'))
  end
  
  def test_2
    # skip
    assert_equal('tONIGHT ON xyz-tv', swapcase('Tonight on XYZ-TV'))
  end
  
end

class FourthExerciseAltSolution < Minitest::Test

  def swapcase(str)
    str.gsub(/([[:lower:]]*)([[:upper:]]*)/) { $1.upcase + $2.downcase }    
  end

  def test_1
    # skip
    assert_equal('cAMELcASE', swapcase('CamelCase'))
  end
  
  def test_2
    # skip
    assert_equal('tONIGHT ON xyz-tv', swapcase('Tonight on XYZ-TV'))
  end
  
end