require 'minitest/autorun'
require 'minitest/pride'

class QuestionSeven < Minitest::Test
  def test_kernel_eval
    def add_eight(number)
      number + 8
    end

    number = 2

    how_deep = "number"
    5.times { how_deep.gsub!("number", "add_eight(number)")}

    assert_equal 42, eval(how_deep)
  end
end