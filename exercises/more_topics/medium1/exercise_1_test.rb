require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise1Test < Minitest::Test
  attr_accessor :listener

  class Device
    def initialize
      @recordings = []
    end

    def listen
      record(yield) if block_given?
    end

    def play
      @recordings.last
    end

    private

    def record(recording)
      @recordings << recording
    end
  end

  def setup
    @listener = Device.new
  end

  def test_one_recording
    assert_nil(listener.play)
    listener.listen { "Hello World"}
    assert_equal("Hello World", listener.play)
  end

  def test_no_recording
    listener.listen
    assert_nil(listener.play)
  end
end