require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'
require_relative './frames'

class FramesTest < Minitest::Test
  include Frames

  attr_accessor :generic_frame, :last_frame

  def setup
    @generic_frame = Frames::GenericFrame.new
    @last_frame = Frames::LastFrame.new
  end

  def test_generic_frame_init
    assert(generic_frame.instance_of?(Frames::GenericFrame))
  end

  def test_last_frame_init
    assert(last_frame.instance_of?(Frames::LastFrame))
  end
end