require 'minitest/autorun'
require 'minitest/pride'

# what is the output of the following code?
class QuestionFive < Minitest::Test
  def test_local_variable_scope
    answer = 42

    def mess_with_it(some_number)
      some_number += 8
    end

    new_answer = mess_with_it(answer)

    assert_equal 50, new_answer
    assert_equal 34, answer - 8
# answers are above because a method only has
# access to a local variable if it is passed in
# as a parameter, the method takes a copy of the
# local variable reference, but in the statement
# some_number += 8 a new object of type number
# is created (with its own reference) so the passed
# in local variable answer never gets modified
  end
end
