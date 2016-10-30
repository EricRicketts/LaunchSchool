require 'minitest/autorun'
require 'minitest/pride'
require 'stringio'
require_relative './ui'

class CaculatorTest < Minitest::Test

  def setup()
    @ui = UI.new
    @input = StringIO.new("test info\n")
    @output = StringIO.new
    @input_received = @ui.receive(stdin: @input)
    @ui.give("test message", stdout: @output)
  end

  def test_ui_class_output_and_string_io_overwrites
    assert_equal "test message\n", @output.string
  end

  def test_ui_class_input_and_string_io_overwrites
    assert_equal "test info\n", @input.string
    assert_equal "test info", @input_received
  end

end

class InputNumbersTest < Minitest::Test

  def setup()
    @ui = UI.new
    @input = StringIO.new("1 2\n")
    @input_received = @ui.receive(stdin: @input)
    @output = StringIO.new    
  end

  def test_ask_for_numbers
    @ui.give("Please input two numbers separated by one or more spaces: ", stdout: @output)
    assert_equal "Please input two numbers separated by one or more spaces: \n", @output.string
    assert_equal "1 2", @input_received
    numbers = @input_received.split.map {|char| char.to_f} 
    assert_equal numbers, [1.0, 2.0]
  end
  
end