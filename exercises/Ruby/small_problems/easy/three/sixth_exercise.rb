require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Exclusive Or

The || operator returns a truthy value if either or both of its operands are truthy, a falsey value if both operands are falsey.
The && operator returns a truthy value if both of its operands are truthy, and a falsey value if either operand is falsey.
This works great until you need only one of two conditions to be truthy, the so-called exclusive or.

In this exercise, you will write a method named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, false otherwise.

Examples:

xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false
=end

class SixthExercise < Minitest::Test

  def xor?(bool1, bool2)
    (bool1 && !bool2) || (!bool1 & bool2)
  end

  def test_false_true
    assert(xor?(5.even?, 4.even?))
  end
  
  def test_true_false
    assert(xor?(5.odd?, 4.odd?))
  end
  
  def test_true_true
    refute(xor?(5.odd?, 4.even?))
  end
  
  def test_false_false
    refute(xor?(5.even?, 4.odd?))
  end
  
end