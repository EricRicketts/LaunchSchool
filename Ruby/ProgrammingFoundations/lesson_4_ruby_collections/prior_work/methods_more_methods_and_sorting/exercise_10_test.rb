require 'minitest/autorun'
require 'minitest/pride'

class Exercise10Test < Minitest::Test
  def test_return_from_map
    out = capture_io do
      result = [1, 2, 3].map do |num|
        if num > 1
          puts num
        else
          num
        end
      end
      assert_equal [1, nil, nil], result
    end
  end
end