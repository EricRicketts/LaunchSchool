require 'minitest/autorun'
require 'minitest/pride'

class QuestionThree < Minitest::Test
  def setup
    def tricky_method(a_string_param, an_array_param)
      a_string_param += "rutabaga"
      an_array_param << "rutabaga"
    end
  end

  def test_trickey_method
    my_string = "pumpkins"
    my_array = ["pumpkins"]

    tricky_method(my_string, my_array)

    assert_equal "pumpkins", my_string
    assert_equal ["pumpkins", "rutabaga"], my_array

# for my_string the concatenation operator + joins the string
# with another string to produce a new string, the operator does
# not change the underlying string
# in the case of the array, the shovel operator does change is caller
  end
end