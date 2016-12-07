require 'minitest/pride'
require 'minitest/autorun'

class QuestionFive < Minitest::Test
  def setup
    def color_valid(color)
      if color == "blue" || color == "green"
        return true
      else
        return false
      end
    end

    def color_valid2(color)
      color == "blue" || color == "green"
    end

  end # setup

  def test_color_valid
    assert color_valid("blue")
    assert color_valid("green")
    refute color_valid("red")
  end

  def test_color_valid2
    assert color_valid2("blue")
    assert color_valid2("green")
    refute color_valid2("red")
  end

end