class FakeIO

  attr_accessor :input, :output

  def self.each_input(input)
    io = FakeIO.new(input)
    $stdin = io
    $stdout = io

    yield

  ensure
    $stdin = STDIN
    $stdout = STDOUT
  end

  def initialize(input)
    @input = input
    @output = ""
  end

  def gets
    input.shift.to_s
  end

  def puts(string)
    output << "#{string}\n"
  end
end

=begin
module SpecHelper
  def local_io(in_str)
    old_stdin, old_stdout = $stdin, $stdout
    $stdin = StringIO.new(in_str)
    $stdout = StringIO.new
    yield
    $stdout.string
  ensure
    $stdin, $stdout = old_stdin, old_stdout
  end
end
=end
