require 'minitest/pride'
require 'minitest/autorun'
require 'pry-byebug'

class Exercise3Test < Minitest::Test

  def gather(items)
    first_phrase = "Let's start gathering food."
    last_phrase = "Nice selection of food we have gathered!"
    Array.new.push(first_phrase, yield(items), last_phrase)
  end

  def test_gather
    items = %w[apples corn cabbage wheat]
    expected = [
      "Let's start gathering food.",
      "apples, corn, cabbage, wheat",
      "Nice selection of food we have gathered!"
    ]
    assert_equal(expected, gather(items) { |foods| "#{foods.join(', ')}" })
  end
end
