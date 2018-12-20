require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise4Test < Minitest::Test

  def extract_raptors(birds)
    yield(birds) if block_given?
  end

  def test_raptors
    birds = %w[raven finch hawk eagle]
    raptors = extract_raptors(birds) do |bird_arr|
      bird_arr.slice(2..-1)
    end
    assert_equal(%w[hawk eagle], raptors)
  end
end
