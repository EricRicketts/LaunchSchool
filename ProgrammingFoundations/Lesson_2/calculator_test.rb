require 'minitest/autorun'
require 'minitest/pride'
require 'stringio'
require_relative './ui'

class UIClassTest < Minitest::Test

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

class InputNumbersAndPerformOperationTest < Minitest::Test

  def setup()
    @ui = UI.new
    @output = StringIO.new    
  end

  def test_ask_for_numbers
    input = StringIO.new("1 2\n")
    input_received = @ui.receive(stdin: input)
    @ui.give("Please input two numbers separated by one or more spaces: ", stdout: @output)
    assert_equal "Please input two numbers separated by one or more spaces: \n", @output.string
    assert_equal "1 2", input_received
    numbers = input_received.split.map {|char| char.to_f} 
    assert_equal numbers, [1.0, 2.0]
  end

  def test_ask_for_operation
    @ui.give("Please type in the arithmetic operation you want on the two numbers (-, +, *, or /): ", stdout: @output)
    assert_equal "Please type in the arithmetic operation you want on the two numbers (-, +, *, or /): \n", @output.string
    input = StringIO.new("+\n")
    input_received = @ui.receive(stdin: input)
    assert_equal "+", input_received
  end

  def test_perform_arithmetic_operation
    numbers = [1.0, 2.0]
    assert_equal numbers[0].send('+', numbers[1]), 3.0
    assert_equal numbers[0].send('-', numbers[1]), -1.0
    assert_equal numbers[0].send('*', numbers[1]), 2.0
    assert_equal numbers[0].send('/', numbers[1]), 0.5
  end
  
end