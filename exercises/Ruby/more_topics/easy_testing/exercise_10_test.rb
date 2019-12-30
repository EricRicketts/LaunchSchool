require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise10Test < Minitest::Test
  attr_accessor :list, :str

  def setup
    @list = %w(abc def ghi)
    @str = 'ghi'
  end

  def test_refute_includes
    # this test will fail
    skip
    refute_includes(list, str)
  end

  def test_assert_includes
    assert_includes(list, str)
  end
end