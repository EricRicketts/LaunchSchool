require 'minitest/autorun'
require 'minitest/pride'

class QuestionTwo < Minitest::Test
  def test_not_equals_operator
    x = "one"
    assert 1 != 2, "!= true when objects not equal"
    refute "one" != x, "!= false when objects equal"
  end

  def test_negation_operator
    x = "one"
    y = !x
    z = !!x
    assert x.is_a?(String)
    refute x.is_a?(TrueClass), "not boolean type without operator"
    refute y, "unless object is nil, returns falsey"
    assert y.is_a?(FalseClass), "another way to prove falsey"
    assert z, "converted to TrueClass"
    assert z.is_a?(TrueClass)
  end

  def test_bang_convention
    ary = [1, 2, 2, 3]
    ary.uniq!
    assert_equal ary, [1, 2, 3], "in this case ! mutates orignal array"
  end

  def test_variable_naming
    one_1 = 1
    assert one_1
  end
end

=begin
1.  != is the not equals operator and it should be used in boolean
operations.
2.  ! is the negation operator, one instance of ! negates the argument
while two instances of ! returns a true or false.  Note preceding a
variable with an ! operator will return an instance of either a TrueClass
or a FalseClass
3.  In terms of putting ! after a method it is a convention, not a hard
and fast rule.  It either means the caller gets mutated or some other
unusual behavoir is invoked.  Any variable name beginning or ending with
! produces a syntax error.
4.  For any variable or method name in ruby starting with a ? produces
a syntax error.  If a variable ends in ? it produces a syntax error, only
methods can end in a ? and it is just by convention that the method returns
a boolean result
6.  !! does the same thing as ! does in that it returns either a TrueClass
or a FalseClass
one other note ? can be coupled with : to produce the ternary operator ? :
=end