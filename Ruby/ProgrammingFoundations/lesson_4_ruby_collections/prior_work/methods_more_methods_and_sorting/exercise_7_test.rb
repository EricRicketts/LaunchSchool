require 'minitest/autorun'
require 'minitest/pride'

class Exercise7Test < Minitest::Test
  def test_any
    out = capture_io do
      result = [1, 2, 3].any? do |num|
        puts num
        num.odd?
      end
      assert result # any? looks for any elements
      # that match the boolean criteria in the block
    end
  end
end