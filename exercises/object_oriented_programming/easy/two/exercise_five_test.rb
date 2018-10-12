require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseFiveTest < Minitest::Test
  class Something
    def initialize
      @data = 'Hello'
    end

    def dupdata
      @data + @data
    end

    def self.dupdata
      'ByeBye'
    end
  end

  def test_one
    expected = ["HelloHello", "ByeBye"]
    assert_equal(expected, [Something.new.dupdata, Something.dupdata])
  end
end