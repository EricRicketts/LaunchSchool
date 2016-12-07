require 'minitest/autorun'
require 'minitest/pride'

class QuestionFour < Minitest::Test
  def setup
    def tricky_method_two(a_string_param, an_array_param)
      a_string_param << 'rutabaga'
      an_array_param = ['pumpkins', 'rutabaga']
    end
  end

  def test_tricky_method
    my_string = "pumpkins"
    my_array = ["pumpkins"]

    tricky_method_two(my_string, my_array)

    assert_equal 'pumpkinsrutabaga', my_string
    assert_equal ['pumpkins'], my_array
  end
# reverse of question three, shovel method << also mutates
# a ruby string, while in the case of the array, it is just
# assigned a new value within the body of the method, but
# since this is a different object inside the array, it does
# not affect the local variable outside of the array
end