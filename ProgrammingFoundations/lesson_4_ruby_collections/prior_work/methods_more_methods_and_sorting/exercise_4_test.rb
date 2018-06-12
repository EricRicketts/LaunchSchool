require 'minitest/autorun'
require 'minitest/pride'

class Exercise4Test < Minitest::Test
  def test_each_with_object_hash
    result = ['ant', 'bear', 'cat'].each_with_object({}) { |value, hash| hash[value[0]] = value }
    expected = { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}
    assert_equal expected, result
  end
end