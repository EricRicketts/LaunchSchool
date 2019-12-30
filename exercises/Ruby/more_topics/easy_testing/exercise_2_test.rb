require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise2Test < Minitest::Test
  attr_accessor :str, :expected

  def setup
    @str = 'ABC'
    @expected = 'xyz'
  end

  def test_downcase_with_refute_equal
    refute_equal(expected, str.downcase)
  end

  def test_downcase_with_assert
    assert(!(expected == str.downcase))
  end

  def test_with_assert_equal
    # this test will fail
    skip
    assert_equal(expected, str.downcase)
  end
end