require 'byebug'

# putting the array values into descriptive constant name like
# ROCK_WINS_ARRAY = %W(lizard scissors) draws a rubocop error
# because the implementation of #win? never calls the hash values
# explicitly

ROCK_WINS_AGAINST = %w(lizard scissors)
PAPER_WINS_AGAINST = %w(rock spock)
SCISSORS_WINS_AGAINST = %w(lizard paper)
LIZARD_WINS_AGAINST = %w(paper spock)
SPOCK_WINS_AGAINST = %w(rock scissors)

WINNING_RELATIONSHIPS = {
  'rock' => ROCK_WINS_AGAINST,
  'paper' => PAPER_WINS_AGAINST,
  'scissors' => SCISSORS_WINS_AGAINST,
  'lizard' => LIZARD_WINS_AGAINST,
  'spock' => SPOCK_WINS_AGAINST
}

# create an Array method to better name operation
# on game objects in #win?
class Array
  def beats?(element)
    include?(element)
  end
end

def win?(first, second)
  WINNING_RELATIONSHIPS[first].beats?(second)
end
