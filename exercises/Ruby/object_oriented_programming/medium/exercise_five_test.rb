require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseFiveTest < Minitest::Test
  class Minilang
    VALID_COMMANDS = %w[PUSH ADD SUB MULT DIV MOD POP PRINT]
    def initialize(input)
      @input = parse_input(input)
      @register = 0
      @stack = Array.new
    end

    def eval
      input.each do |command|
        if command.match(/\A[-+]?\d+\z/)
          self.register = command.to_i
        else
          self.send(command.downcase.to_sym)
        end
      end
    end

    protected

    attr_accessor :register, :stack

    private

    attr_accessor :input

    def add
      self.register = self.register + self.stack.pop
    end

    def div
      self.register = self.register / self.stack.pop
    end

    def mod
      self.register = self.register % self.stack.pop
    end

    def mult
      self.register = self.register * self.stack.pop
    end

    def parse_input(input)
      token_array = input.strip.split
      invalid_tokens = token_array.reject do |token|
        token.match?(/\d+/) || VALID_COMMANDS.include?(token)
      end
      if invalid_tokens.empty?
        token_array
      else
        raise StandardError.new("Invalid token: #{invalid_tokens.first}")
      end
    end

    def pop
      if self.stack.last.nil?
        raise StandardError.new("Empty stack!")
      else
        self.register = self.stack.pop
      end
    end

    def print
      puts register
    end

    def push
      self.stack.push(register)
    end

    def sub
      self.register = self.register - self.stack.pop
    end
  end

  def test_one
    assert_output(/0\n/) { Minilang.new('PRINT').eval }
  end

  def test_two
    assert_output(/15\n/) { Minilang.new('5 PUSH 3 MULT PRINT').eval }
  end

  def test_three
    assert_output(/5\n3\n8\n/) { Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval }
  end

  def test_four
    assert_output(/10\n5\n/) { Minilang.new('5 PUSH 10 PRINT POP PRINT').eval }
  end

  def test_five
    result = assert_raises(StandardError) { Minilang.new('5 PUSH POP POP PRINT').eval }
    assert_equal("Empty stack!", result.message)
  end

  def test_six
    assert_output(/6\n/) { Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval }
  end

  def test_seven
    assert_output(/12\n/) { Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval }
  end

  def test_eight
    result = assert_raises(StandardError) { Minilang.new('-3 PUSH 5 XSUB PRINT').eval }
    assert_equal("Invalid token: XSUB", result.message)
  end

  def test_nine
    assert_output(/8\n/) { Minilang.new('-3 PUSH 5 SUB PRINT').eval }
  end

  def test_ten
    assert_output(//) { Minilang.new('6 PUSH').eval }
  end

end
