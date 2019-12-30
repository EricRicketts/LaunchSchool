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
And another class:

class Bingo
  def rules_of_play
    #rules of play
  end
end
What can we add to the Bingo class to allow it to
inherit the play method from the Game class?
=end

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    "Look it up!"
  end
end

class QuestionEightTest < Minitest::Test

  # when we use the "< Class Name" in the class
  # definition we are telling the class under
  # construction to inherit all of the attributes
  # and methods from the parent class.  So in this
  # case the Bingo class can call #play.  This works
  # becaue in the lookup chain, if Ruby cannot find
  # Bingo#play it then looks the method in a superclass
  # which is Game in this case.
  def test_1
    bingo = Bingo.new
    assert_equal("Start the game!", bingo.play)
  end
end