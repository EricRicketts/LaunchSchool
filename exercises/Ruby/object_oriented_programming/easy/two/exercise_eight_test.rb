require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseEightTest < Minitest::Test
  class Expander
    def initialize(string)
      @string = string
    end

    def to_s
      expand(3)
    end

    private

    def expand(n)
      @string * n
    end
  end

  def test_one
    expander = Expander.new('xyz')
    assert_equal('xyzxyzxyz', expander.to_s)
  end
end