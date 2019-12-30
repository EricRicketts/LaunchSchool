require 'minitest/autorun'
require 'minitest/pride'

class Exercise5Test < Minitest::Test
  def test_find_first_Be
    flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
    assert_equal 3, flintstones.find_index { |name| name[0, 2].eql?("Be") }
  end
end