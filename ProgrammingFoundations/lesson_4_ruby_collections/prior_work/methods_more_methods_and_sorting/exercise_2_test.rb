require 'minitest/autorun'
require 'minitest/pride'

class  Exercise2Test < Minitest::Test
  def test_count
    result = ['ant', 'bat', 'caterpillar'].count do |str|
      str.length < 4
    end
    assert_equal 2, result
  end
end