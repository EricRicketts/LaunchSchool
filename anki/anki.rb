# require 'minitest/autorun'
# require 'minitest/pride'
require 'pry-byebug'

require 'minitest/autorun'
require 'minitest/pride'


class AnkiTest < Minitest::Test
  attr_accessor :is_even

  def setup
    @is_even = lambda { |n| n.even? }
  end

  def complement_v1(predicate, value)
    not predicate.call(value)
  end

  def complement_v2(predicate)
    lambda do |value|
      not predicate.call(value)
    end
  end

  def test_v1
    expected = [false, true]
    result = [complement_v1(is_even, 4), complement_v1(is_even, 5)]
    assert_equal(expected, result)
  end

  def test_v2
    x = complement_v2(is_even)
    expected = [false, true]
    result = [x.call(4), x.call(5)]
    assert_equal(expected, result)
  end
end
