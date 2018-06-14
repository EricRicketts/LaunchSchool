require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Mutation

What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

=end

class TenthExercise < Minitest::Test

  def test_mutation
    array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
    array2 = []
    array1.each { |value| array2 << value }
    array1.each { |value| value.upcase! if value.start_with?('C', 'S') } 
    assert_equal(%W(Moe Larry CURLY SHEMP Harpo CHICO Groucho Zeppo), array2)
    assert_equal(array1, array2) 
    refs_arr1 = array1.map {|e| e.object_id}  
    refs_arr2 = array2.map {|e| e.object_id}
    assert_equal(refs_arr1, refs_arr2)  
  end

=begin
the strings that begin with 'C' and 'S' are capitalized in both array1 and array2
because array2 got a copy of each value.  This is because the block variable was
given a copy of each element in arrray1.  Now when eah value in array1 is mutated
in place by value.upcase! then that same change in reflected in array2 because
each element in array2 contains the same reference as in array1.  The last assertion
proves this.
=end

  def test_avoid_multation
    array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
    array2 = []
    array1.each { |value| array2 << value }
    array1.map! { |value| value.start_with?('C', 'S') ? value.upcase : value} 
    assert_equal(%W(Moe Larry CURLY SHEMP Harpo CHICO Groucho Zeppo), array1)
    assert_equal(%w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo), array2)
  end
  
end