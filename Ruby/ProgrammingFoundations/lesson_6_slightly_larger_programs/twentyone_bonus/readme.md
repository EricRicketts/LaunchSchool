## Notes To The Code Reviewer

### Bonus Features
1. I only update the player score and dealer score when either contestant asks for a _hit_, otherwise
the score for each contestant is cached in a variable.
2. My `#play_again?` is only called once in the main play loop.
3. The user can exit at any time by entering (q)uit, I had to pass this variable up through
the hierarchy.  I also had to pass it's result off to `global_quit` otherwise the initialization
of `plyr_response` would be incorrect after the first round of play.
4. A game consists of 5 rounds, the game tally is kept at the end of each round, when a game is
finished the user is asked if he/she wants to play again.

### Design Decisions
1. I made use of Ruby Modules otherwise I felt the main program would have been too long.
2. I tried to organize the code into the appropriate modules, but without Classes this
becomes more difficult.  I now see why Launch School has us start out with procedural
programming.  We will appreciate objects that much more when introduced in 120.
3. I spent a lot of time up front with the ASCII cards.  UTF-8 offers card symbols
for Club, Diamond, Heart, and Spade.
4. This program took longer than I thought because I did not understand the rules well
enough. I thought cards were taken from the deck until the game was over.  I quickly
found out that with 5 rounds per game, one can run out of cards.  Checking the number
of cards on the fly was a nightmare.  Fortunately, I read an official rule site for the
game and found out twenty-one reshuffles the deck after each round.  I can now understand
why!!
5. I used `until` loops for player and dealer turns because I felt they read better when
paired with a guard method.
6. I used `Kernel#loop` for the outer loops because I needed more freedom on where to break
out of given loop.
7. I have 6 method calls in `#get_and_display_round_result` because I hated having all
of that code in the bottom of the game loop.  The above method does more than one thing
but I hope its name accurately tells the user what is happening.
8. I need two different methods for displaying dealer cards because when it is the player's
turn, one dealer card is hidden but when it is the dealer's turn all of his cards are exposed.
9. Though I do compute busts more than one time, I wanted just one place to update and present
the round and game results, which was at the end of a given round.  Thus I need to compute
bust coniditions to exit a contestant turn, but I cached the scores so the overhead was not
excessive when identifying a bust at the end of a round.  This made the end of round code more
consistent.

### Usage
1. Run all tests `rake test`.  I could not really test anything associated with the card
views and as such, some of the methods in both `playable.rb` and `viewable.rb` were not tested.
2. Run rubocop on all files `rubocop app`.  Very important note I am using rubocop
version `0.57.2` which is the latest version of rubocop.
3. Run the app `ruby app/twentyone_bonus.rb`.