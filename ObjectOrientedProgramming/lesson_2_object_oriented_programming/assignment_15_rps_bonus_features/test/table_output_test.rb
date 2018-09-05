require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib/table'
require_relative '../lib/human'
require_relative '../lib/computer'

class TableOutputTest < Minitest::Test
  attr_accessor :table, :human, :computer, :expected_header, :expected_body

  def setup
    @human = Human.allocate
    human.name = "Eric Ricketts"
    human.tally = 0

    @computer = Computer.new
    computer.name = "HAL 9000"

    headers = [
      "Round", human.name, computer.name, "Winner",
      human.name + " Tally", computer.name + " Tally"
    ]
    @table = Table.new(headers, opt_for_size = "scissors")

    @expected_header = <<HEADER
|        Round        |    Eric Ricketts    |      HAL 9000       |       Winner        | Eric Ricketts Tally |   HAL 9000 Tally    |
-------------------------------------------------------------------------------------------------------------------------------------
HEADER

    @expected_body = <<BODY
|          1          |      Scissors       |        Paper        |    Eric Ricketts    |          1          |          0          |
-------------------------------------------------------------------------------------------------------------------------------------
|          2          |        Rock         |        Rock         |         Tie         |          1          |          0          |
-------------------------------------------------------------------------------------------------------------------------------------
|          3          |        Rock         |        Paper        |      HAL 9000       |          1          |          1          |
-------------------------------------------------------------------------------------------------------------------------------------
BODY
  end

  def test_make_table_header
    data = []
    assert_equal(expected_header, table.output(data))
  end

  def test_make_table
    data = [
      [ "1", "Scissors", "Paper", "Eric Ricketts", "1", "0" ],
      [ "2", "Rock", "Rock", "Tie", "1", "0" ],
      [ "3", "Rock", "Paper", "HAL 9000", "1", "1" ]
    ]
    expected = (expected_header << expected_body)
    assert_equal(expected, table.output(data))
  end
end