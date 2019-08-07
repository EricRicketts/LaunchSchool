require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
You are given a method named spin_me that takes a string as an argument
and returns a string that contains the same words, but with each word's
characters reversed. Given the method's implementation, will the returned
string be the same object as the one passed in as an argument or a
different object?
=end

class EleventhExercise < Minitest::Test

  def spin_me(str)
    str.split.each do |word|
      word.reverse!
    end.join(" ")
  end

  def test_spin_me
    input = 'hello world'
    expected = "olleh dlrow"
    result = spin_me(input)
    assert_equal(expected, result)
    # it will be a different object this is
    # because Array#each will return the original
    # array and even though this array has the
    # same object_id, its contents have been changed
    # now with the Array#join method we get a different
    # string than the input because the contnets of the
    # returned array are now different.
  end
end

=begin
the Launch School was the right answer.  A new object
is created when we call str.split, this returna a new
array which was created from a string.  Now we are calling
Array#each on this new array, when we join we are going
to get a new string object.
=end
