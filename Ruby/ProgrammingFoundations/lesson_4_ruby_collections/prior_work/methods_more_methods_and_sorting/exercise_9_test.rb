require 'minitest/autorun'
require 'minitest/pride'

class Exercise9Test < Minitest::Test
  def test_map_on_hash
    result = { a: 'ant', b: 'bear' }.map do |key, value|
      if (value.length > 3)
        value
      end
    end
    assert_equal [nil, 'bear'], result # map always returns an array
    # in this case the mapping function does not include any key
    # secondly map works on every key, value pair in the hash, so the
    # first return value is nil because value.length = 3 ('ant')
  end
end