### Object Oriented Twenty-One Assignment

To play the game: `ruby play_twenty_one.rb`.  Optionally, to run the tests `rake all`.  _Rubocop_ clean.

#### Features
1. Rules are governed by the [prior procedural implementation](https://launchschool.com/lessons/de05b300/assignments/b6baf7e6).
2. A game consists of 10 or more rounds, the first to win 10 rounds wins the game.
3. At the end of a game a player has the option to play another game, there is no tracking of the number of games won.
4. A player can quit the game at any time during the player turn.

#### Design Decisions
1. _Card_ is nothing but a state container, that is why I made it a _Struct_.  I defined _Card#to_s_ in order to use the _AsciiCards Module_.
2. _Card_ is a collaborator for the _Deck class_.
3. My key design decision was to put a significant amount of abstraction into the _Rules Module_.
4. I felt a generic Card Deck could be assigned values based on the rules of the game.  This also kept the _Player_ and _Dealer_ classes simple.
5. The _Rules_ and _Messaging_ modules allowed me to keep the _TwentyOne class_ focused just on orchestration state behaviors.
6. I reused the ASCII card code from my procedural implementation. 