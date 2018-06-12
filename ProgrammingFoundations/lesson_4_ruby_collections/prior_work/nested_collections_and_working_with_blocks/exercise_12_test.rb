require 'minitest/autorun'
require 'minitest/pride'

class Exercise12Test < Minitest::Test
  def test_manually_flatten
    arr = [['stars', 'river'], 'letter', ['leaves', ['horses', 'table']]]
    expected = %w(stars river letter leaves horses table)
    result = []

    arr.each do |elem|
      if elem.is_a?(String)
        result.push(elem)
      elsif elem.any? { |ary| ary.is_a?(Array) }
        elem.each do |ary|
          result.push(*ary)
        end
      else
        result.push(*elem)
      end
    end
    assert_equal expected, result
  end
end