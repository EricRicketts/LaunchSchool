require 'byebug'
require 'minitest/autorun'
require 'minitest/pride'

=begin
String Assignment

Take a look at the following code:

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name
What does this code print out? Think about it for a moment before continuing.

If you said that code printed

Alice
Bob
you are 100% correct, and the answer should come as no surprise. Now, let's look at something a bit different:

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name
What does this print out? Can you explain these results?
=end

class NinthExercise < Minitest::Test

  def test_first_reference
    name = 'Bob'
    save_name = name
    assert(name.object_id == save_name.object_id)
    name = 'Alice'
    assert(name == 'Alice' && save_name == 'Bob')
    refute(name.object_id == save_name.object_id)
  end

  def test_second_reference
    name = 'Bob'
    save_name = name
    name.upcase!
    assert(name == 'BOB' && save_name == 'BOB')
    assert(name.object_id == save_name.object_id)
  end

=begin
in the first case a new object with name = 'Alice', so
save_name still points to the original object, but with the
reassignment of name to 'Alice', the object_ids of both
variables are now different.  We can see from the last
assertion that the references of both variables are now
different.

However in the second case the object, which is the string 'Bob'
is modified in place, a new assignment is not made and hence a
new object_id IS NOT issued.  A better way of saying this is that
name is mutated (changed) in place, thus the reference itself does
not change only the value at the reference.  
=end  
end