require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseOneTest < Minitest::Test
  class Machine

    def start
      flip_switch(:on)
    end

    def stop
      flip_switch(:off)
    end

    private

    attr_writer :switch

    def flip_switch(desired_state)
      self.switch = desired_state
    end
  end

  def test_one
    machine = Machine.new
    machine.start
    start_state = machine.instance_variable_get("@switch")
    machine.stop
    end_state = machine.instance_variable_get("@switch")
    expected = [:on, :off]
    results = [start_state, end_state]
    assert_equal(expected, results)
  end
end