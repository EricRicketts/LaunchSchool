require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Banner
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    outline = "-" * message.length
    "+-#{outline}-+"
  end

  def empty_line
    empty_spaces = ' ' * message.length
    "| #{empty_spaces} |"
  end

  def message_line
    "| #{message} |"
  end
end

class ExerciseOneTest < Minitest::Test
  def test_one
    expected = <<-BANNER
+--+
|  |
|  |
|  |
+--+
BANNER
    assert_equal(expected.chomp, Banner.new('').to_s)
  end

  def test_two
    phrase = "To boldly go where no one has gone before."
    expected = <<-BANNER
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
BANNER
  assert_equal(expected.chomp, Banner.new(phrase).to_s)
  end
end