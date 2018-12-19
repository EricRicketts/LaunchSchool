require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise3Test < Minitest::Test
  attr_accessor :value

  def setup
    @value = "foo"
  end

  def test_with_assert_nil
    # this test will fail
    skip
    assert_nil(value)
  end

  def test_with_assert_equal
    # this test will fail
    skip
    assert_equal(nil, value)
  end

  def test_with_refute_nil
    refute_nil(value)
  end

  def test_with_refute_equal
    refute_equal(nil, value)
  end
end