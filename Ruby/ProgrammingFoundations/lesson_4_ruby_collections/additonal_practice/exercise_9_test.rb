require 'minitest/autorun'
require 'minitest/pride'

class Exercise9Test < Minitest::Test
  def titlelize(string)
    string.split.map(&:capitalize).join(' ')
  end

  def test_titlelize
    words = "the flintstones rock"
    expected = "The Flintstones Rock"
    assert_equal expected, titlelize(words)
  end
end