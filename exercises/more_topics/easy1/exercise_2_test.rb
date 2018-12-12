require 'minitest/autorun'
require 'minitest/reporters'
require 'pry-byebug'
Minitest::Reporters.use!

class Exercise2Test < Minitest::Test

  def compute
    block_given? ? yield : "Does not compute."
  end

  def compute_v2(x)
    block_given? ? yield(x) : "Does not compute."
  end

  def test_no_block_given
    assert_equal(Array.new(2, 'Does not compute.'), [compute, compute_v2("foo")])
  end

  def test_add_two_v2
    assert_equal(12, compute_v2(4) { |n| n + compute { 5 + 3 } })
  end

  def test_concat_two_chars_v2
    assert_equal('abc', compute_v2('c') { |chr| compute { 'a' + 'b'} + chr })
  end
end