require 'minitest/autorun'
require 'minitest/pride'

# what is the output output of the code below?
class QuestionEight < Minitest::Test
  def setup
    def foo(param = "no")
      "yes"
    end

    def bar(param = "no")
      param == "no" ? "yes" : "no"
    end
  end

  def test_foo_bar
    assert_equal "no", bar(foo)
  end
end
