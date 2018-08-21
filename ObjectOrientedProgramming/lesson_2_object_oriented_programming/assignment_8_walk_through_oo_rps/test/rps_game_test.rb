require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'
require_relative '../rps_game'

class RpsGameTest < Minitest::Test

  def setup
    @rps_game = RPSGame.new
    @human = @rps_game.human
    @computer = @rps_game.computer
  end

  def test_welcome
    # skip
    assert_equal("Welcome to Rock, Paper, Scissors!", @rps_game.display_welcome_message)
  end
  
  def test_goodbye
    # skip
    assert_equal("Thanks for playing Rock, Paper, Scissors.  Good bye!", @rps_game.display_goodbye_message)
  end

  def test_tie
    # skip
    @human.move = "rock"
    @computer.move = "rock"
    assert_equal("It is a tie!", @rps_game.display_winner)
  end

  def test_human_wins
    # skip
    human_moves = ["rock", "paper", "scissors"]
    computer_moves = ["scissors", "rock", "paper"]

    human_moves.each.with_index do |move, idx|
      @human.move = move
      @computer.move = computer_moves[idx]
      assert_equal("You won!", @rps_game.display_winner)
    end
  end
  
  def test_computer_wins
    # skip
    computer_moves = ["rock", "paper", "scissors"]
    human_moves = ["scissors", "rock", "paper"]

    computer_moves.each.with_index do |move, idx|
      @computer.move = move
      @human.move = human_moves[idx]
      assert_equal("Computer won!", @rps_game.display_winner)
    end
  end
  
end