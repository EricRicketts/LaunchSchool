require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib/human'

class HumanTest < Minitest::Test
  attr_accessor :io

  def setup
    @io = StringIO.new
    $stdin = io
  end

  def teardown
    io.rewind
    $stdin = STDIN
  end

  def test_set_name
    io.string = "Foo\n"
    human = ''
    assert_output(/Please enter your name: \n/) { human = Human.new }
    assert_equal("Foo", human.name)
  end

  def test_set_name_after_erred_input
    expected = "Please enter your name: \n" +
      "Sorry, you must enter a value for your name.\n" +
      "Please enter your name: \n"
    human = ''
    out, err = capture_io do
      io.string = "\nFoo\n"
      human = Human.new
    end
    assert_equal(expected, out)
    assert_equal("Foo", human.name)
  end

  def test_choose_move
    expected = /Please choose rock, paper, scissors, lizard, or spock:/
    io.string = "Foo\nrock\n"
    human = ''
    assert_output(expected) { human = Human.new; human.choose }
    assert_instance_of(Rock, human.move.selection)
  end

  def test_choose_incorrect_move
    human = ''
    expected = "Please enter your name: \n" +
    "Please choose rock, paper, scissors, lizard, or spock:\n" +
    "Sorry, invalid choice, try again.\n" +
    "Please choose rock, paper, scissors, lizard, or spock:\n"
    out, err = capture_io do
      io.string = "Foo\nbar\nspock"
      human = Human.new
      human.choose
    end
    assert_equal(expected, out)
    assert_instance_of(Spock, human.move.selection)
  end

end