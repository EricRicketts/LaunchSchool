require 'minitest/autorun'
require 'minitest/pride'

class Exercise5Test < Minitest::Test
  def test_shift_on_hash
    hash = { a: 'ant', b: 'bear' }
    result = hash.shift
    expected = [:a, 'ant']
    assert_equal expected, result
  end
end