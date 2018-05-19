require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'


# Write a function called that takes a string of parentheses,
#  and determines if the order of the parentheses is valid.
#   The function should return true if the string is valid,
#    and false if it's invalid.


# p valid_parentheses( "()" ) == true
# p valid_parentheses( "())" ) == false

# "()"              =>  true
# ")(()))"          =>  false
# "("               =>  false
# "( () ) ( ( () () ) () )"  =>  true

=begin
  "(", "(", ")", ""
AL
  - if number of characters is odd then false
  - if the character is a "("
    - then the next character must be a ")"
    - if the next character is a "(" then the next two characters must be "))"
=end

class Session5Test < Minitest::Test

  def test_1
    assert(valid_parentheses("()"))
  end
  
  def test_2
    refute(valid_parentheses("())"))
  end
  
  def test_3
    skip
    assert(valid_parentheses("()"))
  end
  
end