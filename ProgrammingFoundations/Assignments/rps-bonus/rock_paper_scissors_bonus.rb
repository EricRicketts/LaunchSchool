require 'byebug'

# putting the array values into descriptive constant name like
# ROCK_WINS_ARRAY = %W(lizard scissors) draws a rubocop error
# because the implementation of #win? never calls the hash values
# explicitly

WINNING_RELATIONSHIPS = {
  'rock' => %w(lizard scissors),
  'paper' => %w(rock spock),
  'scissors' => %w(lizard paper)
}

def win?(first, second)
  WINNING_RELATIONSHIPS[first].include?(second)
end
