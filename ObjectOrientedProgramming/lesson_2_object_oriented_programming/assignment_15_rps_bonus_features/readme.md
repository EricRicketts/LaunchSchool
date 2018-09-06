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
Game winners are not persisted.

After each round is played, a round history is displayed which shows the round
number, the move for each player, the round winner and the current tally for
each player.

### Running The Code
1. To run the program: **ruby play_rpsclsp_game.rb**
2. To run rubocop (version 0.46.0): **rubocop lib**
3. To run the tests (optional): **rake test**

### Feature Selections
1. I chose not to implement a computer choice based on history.
2. I chose not to make a computer player take on a "personality".
3. I did this because of the extra amount of time it would have taken
for a robust implementation for each feature.
4. I wanted to focus on the divsion of responsibilities within my design
which I discuss below.
5. Game is Rock, Paper, Scissors, Lizard, and Spock.
6. A class for each move was added.
7. A history of moves was kept for each game.  The format is such that data
can be easily extracted for adjusting the computer selection based on past
human moves, if one desires to add this feature in the future.
8. A tabular output is provided after each round showing a history of the results for each round.

### Design Decisions
1. I tried to ensure that the _RPScLSpGame Class_ only concerned itself with game orchastration.
	- In my opinion, the class itself still had too many lines of code.
	- But I could not figure out how to partition it any further without introducing any additional classes or modules which made no sense from a design perspective.
	- I did not want the _RPScLSpGame Class_ to directly concern itself with terminal output, so I put such methods in a _Statments Module_.
2. I decoupled the _History_ and _Table_ classes from the implementation details of the _RPScLSPGame Class_.
3. I felt it was the job of an orchastrator to provide the game specific information to each of the above classes.
4. I did not want the _RPScLSpGame Class_ to directly concern itself with initializing the _History_ and _Table_ classes, so I delegated this to the _DataInitialization Module_.
5. Since the winning and losing combinations increased considerably with the addition of the _Lizard_ and _Spock_ classes, I implemented a _Rules Module_.
6. Including the _Rules Module_ into the _Move Class_ made for an easy and clearly defined spaceship operator.


