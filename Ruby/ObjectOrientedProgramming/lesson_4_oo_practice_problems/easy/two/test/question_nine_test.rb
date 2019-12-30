require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem statement

If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

What would happen if we added a play method to the Bingo class,
keeping in mind that there is already a method of this name in
the Game class that the Bingo class inherits from.
=end

class QuestionNineTest < Minitest::Test

  class Game
    def play
      "Start the game!"
    end
  end

  class Bingo < Game
    def rules_of_play
      "Look them up!"
    end

    def play
      "Start Bingo!"
    end
  end

  attr_accessor :game, :bingo

  def setup
    @game = Game.new
    @bingo = Bingo.new
  end

  # If we add Bingo#play then that menthod will be
  # called vice Game#play because in the lookup
  # chain Ruby looks for a methdo in the current class
  # since Bingo#play exists in Bingo, that method is
  # called vice Game#play.  Once Ruby finds a method
  # the lookup stops.
  def test_1
    assert_equal("Start the game!", game.play)
  end

  def test_2
    assert_equal("Start Bingo!", bingo.play)
  end
end
