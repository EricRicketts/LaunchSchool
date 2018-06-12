require 'minitest/autorun'
require 'minitest/pride'

class  Exercise3Test < Minitest::Test
  def test_reject
    result = []
    out = capture_io do
      result = [1, 2, 3].reject { |num| puts num }
    end
    assert_equal [1, 2, 3], result
  end
end