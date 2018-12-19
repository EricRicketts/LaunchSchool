require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise6Test < Minitest::Test
  attr_accessor :empolyee

  class Empolyee
  end

  class NoExperienceError < StandardError
  end

  def setup
    @empolyee = Empolyee.new
  end

  def test_raise_exception
    # this test will fail
    skip
    assert_raises(NoExperienceError) { empolyee.hire }
  end

  def test_with_refute_responds_to
    refute_respond_to(empolyee, :hire)
  end
end