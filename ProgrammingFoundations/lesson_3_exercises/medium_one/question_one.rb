require 'minitest/autorun'
require 'minitest/pride'
=begin
Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens).
For this exercise, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:
The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!
=end
class QuestionOne < Minitest::Test
  def setup
    @base_string = "The Flintstones Rock!"
    @expected = "\s" * 0 + "#{@base_string}" + "\n" +
                "\s" * 1 + "#{@base_string}" + "\n" +
                "\s" * 2 + "#{@base_string}" + "\n" +
                "\s" * 3 + "#{@base_string}" + "\n" +
                "\s" * 4 + "#{@base_string}" + "\n" +
                "\s" * 5 + "#{@base_string}" + "\n" +
                "\s" * 6 + "#{@base_string}" + "\n" +
                "\s" * 7 + "#{@base_string}" + "\n" +
                "\s" * 8 + "#{@base_string}" + "\n" +
                "\s" * 9 + "#{@base_string}" + "\n"
  end

  def test_indentations
    output = capture_io do
      10.times { |n| puts @base_string.rjust(@base_string.length + n) }
    end
    assert_equal @expected, output[0]
  end
end