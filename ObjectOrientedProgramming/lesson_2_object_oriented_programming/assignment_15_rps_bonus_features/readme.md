### Textual Description

Rock, Paper, Scissors, Lizard, and Spock is a two-player game where each player
chooses one of five possible moves: rock, paper, scissors, lizard, or spock.
The chosen moves will then be compared to see who wins, according to the following
rules:

- Scissors cuts Paper
- Paper covers Rock
- Rock crushes Lizard
- Lizard poisons Spock
- Spock smashes Scissors
- Scissors decapitates Lizard
- Lizard eats Paper
- Paper disproves Spock
- Spock vaporizes Rock
- Rock crushes Scissors

If the players choose the same move then it is a tie.

In this case the "Two Players" will be the user and a computer opponent.

A game consists of 10 rounds, the first to win 10 rounds wins the game, a tie
round does not change the score.  Users have the option to play multiple games.

At any time during the game, the user can view the move history of that particular
game.

Refine the computer selection based on the history of the human player's moves.

There are some computer players which will have different personalities, for instance
maybe R2D2 has a proclivity to choose "Rock" as his move while C3PO might be inclined
towards paper.

to run all of the tests for now: ruby -Ilib -e 'ARGV.each { |f| require f }' ./test/*_test.rb