require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise5Test < Minitest::Test
  attr_accessor :items, :first_phrase, :last_phrase

  def setup
    @items = %w[apples corn cabbage wheat]
    @first_phrase = "Let's start gathering food."
    @last_phrase = "We've finished gathering!"
  end

  def gather(items)
    first, last = first_phrase, last_phrase
    Array.new.push(first, *yield(items), last)
  end

  def test_gather_version_1
    expected = [
      first_phrase,
      items.slice(0..2).join(', '),
      items.last,
      last_phrase
    ]
    result = gather(items) do |foods|
      Array.new.push(foods.slice(0..-2).join(', '), foods.last)
    end
    assert_equal(expected, result)
  end

  def test_gather_version_2
    expected = [
      first_phrase,
      items.first,
      items.slice(1..-2).join(', '),
      items.last,
      last_phrase
    ]
    result = gather(items) do |foods|
      Array.new.push(foods.first, foods.slice(1..-2).join(', '), foods.last)
    end
    assert_equal(expected, result)
  end

  def test_gather_version_3
    expected = [
      first_phrase,
      items.first,
      items.slice(1..-1).join(', '),
      last_phrase
    ]
    result = gather(items) do |foods|
      Array.new.push(foods.first, foods.slice(1..-1).join(', '))
    end
    assert_equal(expected, result)
  end

  def test_gather_version_4
    expected = [
      first_phrase,
      items.join(', '),
      last_phrase
    ]
    result = gather(items) do |foods|
      foods.join(', ')
    end
    assert_equal(expected, result)
  end
end
