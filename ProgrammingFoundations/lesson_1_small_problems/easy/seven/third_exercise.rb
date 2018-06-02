=begin
Capitalize Words

Write a method that takes a single String argument and returns a new string 
that contains the original value of the argument with the first character of
every word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.

Examples

word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
word_cap('try this 123 out for 1 size') == 'Try This 123 Out For 1 Size'

AL:
  - we need to use split on \s+ to get all the characters associated
  with each word
  - cycle through each word in the array and use a mapping function
    - if char[0] is a lower case letter, then upcase it if not return it
  - join everything in the end with a space
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'


class ThirdExercise < Minitest::Test

  def word_cap(str)
    str.split.map {|word| word[0].match?(/[[:lower:]]/) ? word.capitalize : word}.join(' ')
  end

  def test_1
    # skip
    expected = 'Four Score And Seven'
    result = word_cap('four score and seven')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = 'The Javascript Language'
    result = word_cap('the javaScript language')
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = 'This Is A "quoted" Word'
    result = word_cap('this is a "quoted" word')
    assert_equal(expected, result)
  end
  
  def test_4
    # skip
    expected = 'Try This 123 Out For 1 Size'
    result = word_cap('try this 123 out for 1 size')
    assert_equal(expected, result)
  end
  
end

class ThirdExerciseLS < Minitest::Test

=begin
I like the LS solution better because it is much simpler, my program is redundant
and therefore less robust.  It comes down to understanding what the String#capitalize
method does.  I should have played around with it first before coding.

Since the requirement was that the first letter was to be capitalized and all other
letters lower cased String#capitalize is a perfect fit, "javaScript".capitalize =
"Javascript"
=end

  def word_cap(str)
    str.split.map(&:capitalize).join(" ")
  end

  def test_1
    # skip
    expected = 'Four Score And Seven'
    result = word_cap('four score and seven')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = 'The Javascript Language'
    result = word_cap('the javaScript language')
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = 'This Is A "quoted" Word'
    result = word_cap('this is a "quoted" word')
    assert_equal(expected, result)
  end
  
  def test_4
    # skip
    expected = 'Try This 123 Out For 1 Size'
    result = word_cap('try this 123 out for 1 size')
    assert_equal(expected, result)
  end
  
end

class ThirdExerciseFirstNoCapMethod < Minitest::Test

=begin
AL:
  - so regardless of the word I want to do the following
    - if the first character is a letter than I want to upcase
      it and downcase all remaining characters
      else I want to downcase all letters 
=end

  def word_cap(str)
    str.split.map do |word|
      if word[0].match?(/[[:lower:]]/)
        word[0].upcase + word[1..-1].downcase
      else
        word.downcase
      end
    end.join(' ')    
  end

  def test_1
    # skip
    expected = 'Four Score And Seven'
    result = word_cap('four score and seven')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = 'The Javascript Language'
    result = word_cap('the javaScript language')
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = 'This Is A "quoted" Word'
    result = word_cap('this is a "quoted" word')
    assert_equal(expected, result)
  end
  
  def test_4
    # skip
    expected = 'Try This 123 Out For 1 Size'
    result = word_cap('try this 123 out for 1 size')
    assert_equal(expected, result)
  end
  
end

class ThirdExerciseSecondNoCapMethod < Minitest::Test

  def word_cap(str)
    # fix this in the future to handle the quotes
    # str.scan(/\b(?<![[:punct:]])([[:alpha:]])([[:alnum:]]*)\b/)
    str.gsub(/([[:lower:]])([[:alnum:]]*)/) { $1.upcase + $2.downcase }    
  end

  def test_1
    # skip
    expected = 'Four Score And Seven'
    result = word_cap('four score and seven')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = 'The Javascript Language'
    result = word_cap('the javaScript language')
    assert_equal(expected, result)
  end
  
  def test_3
    skip
    expected = 'This Is A "quoted" Word'
    result = word_cap('this is a "quoted" word')
    assert_equal(expected, result)
  end
  
  def test_4
    # skip
    expected = 'Try This 123 Out For 1 Size'
    result = word_cap('try this 123 out for 1 size')
    assert_equal(expected, result)
  end
    
end