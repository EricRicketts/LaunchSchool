require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FirstExercise < Minitest::Test

=begin
ASCII String Value

Write a method that determines and returns the ASCII string value of a string that is passed in as an argument.
The ASCII string value is the sum of the ASCII values of every character in the string.
(You may use String#ord to determine the ASCII value of a character.)

ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

Algorithm:
  - when I tried running #ord on '' I got an argument error
  - ASCII ord of 0 is for NULL, so we do not need to worry
    about that
  - if string is not empty, convert to array of chars, then sum ordinal value
  - if string is empty return 0
=end

  def ascii_value(str)
    str.empty? ? 0 : str.chars.inject(0) {|sum, char| sum += char.ord}
  end

  def test_one
    assert_equal(984, ascii_value('Four score'))     
  end

  def test_two
    assert_equal(1251, ascii_value('Launch School'))     
  end

  def test_three
    assert_equal(97, ascii_value('a'))     
  end

  def test_four
    assert_equal(0, ascii_value(''))     
  end

end

class FirstExerciseAnotherSolution < Minitest::Test

=begin
I like how concise the solution is but one must make
sure of the encoding scheme before using it.  If the
encoding scheme is not compatible with ASCII then it
will not work.  #bytes produces an array of ordinal
values and I did not know you can just call #sum
on an array.  '' produces [] which sum value is 0.
=end

  def ascii_value(str)
    str.bytes.sum
  end

  def test_one
    assert_equal(984, ascii_value('Four score'))     
  end

  def test_two
    assert_equal(1251, ascii_value('Launch School'))     
  end

  def test_three
    assert_equal(97, ascii_value('a'))     
  end

  def test_four
    assert_equal(0, ascii_value(''))     
  end

end