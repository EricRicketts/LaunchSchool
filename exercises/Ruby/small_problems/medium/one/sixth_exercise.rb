require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class SixthExercise < Minitest::Test

  def minilang(str)
    register = 0
    stack = []
    commands = str.split
    commands.each do |instruction|
      case instruction
      when /\d/ then register = instruction.to_i
      when 'ADD' then register = register + stack.pop
      when 'DIV' then register = register / stack.pop
      when 'MOD' then register = register % stack.pop
      when 'MULT' then register = register*stack.pop       
      when 'PRINT' then puts register
      when 'POP' then register = stack.pop
      when 'PUSH' then stack.push(register)
      when 'SUB' then register = register - stack.pop
      end
    end
  end

  def test_0
    assert_output("0\n") { minilang('PRINT') }      
  end

  def test_1
    assert_output("15\n") { minilang('5 PUSH 3 MULT PRINT') }
  end

  def test_2
    assert_output("5\n3\n8\n") { minilang('5 PRINT PUSH 3 PRINT ADD PRINT') }
  end

  def test_3
    assert_output("5\n") { minilang('5 PUSH POP PRINT') }
  end
  
  def test_4
    assert_output("5\n10\n4\n7\n") { minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT') }
  end
  
  def test_5
    assert_output("6\n") { minilang('3 PUSH PUSH 7 DIV MULT PRINT') }
  end
  
  def test_6
    assert_output("12\n") { minilang('4 PUSH PUSH 7 MOD MULT PRINT') }
  end
  
  def test_7
    assert_output("8\n") { minilang('-3 PUSH 5 SUB PRINT') }
  end
  
  def test_8
    assert_output("") { minilang('6 PUSH') }
  end
  
end