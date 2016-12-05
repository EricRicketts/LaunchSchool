require 'minitest/autorun'
require 'minitest/pride'

class QuestionThree < Minitest::Test
  def tricky_method(a_string_param, an_array_param)
    a_string_param += "rutabaga"
    an_array_param << "rutabaga"

    return a_string_param, an_array_param
  end

  def test_expected_method_return
    my_string = "pumpkins"
    my_array = ["pumpkins"]
    my_string, my_array = tricky_method(my_string, my_array)

    exepected_string = "pumpkinsrutabaga"
    expected_array = %w(pumpkins rutabaga)

    assert_equal exepected_string, my_string
    assert_equal expected_array, my_array
  end
end
