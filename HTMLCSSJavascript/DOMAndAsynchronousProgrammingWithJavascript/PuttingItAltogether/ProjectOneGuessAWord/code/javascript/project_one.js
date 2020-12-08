document.addEventListener('DOMContentLoaded', function() {

});

/*
Game flow
1.  when the game initializes spaces should be shown in the HTML for the letter of each word, this should be done
for div#spaces, add the appropriate amount of span elements for each letter, this should be obtained from the
game logic

2.  the game takes keyboard input from the user, as the user has to guess a letter for the word.  Implications:
  1.  We need to set an event listener for the keyboard input and when the user hits a keystroke the keystroke needs
  to be ensured that it is only a letter, if it is not a letter leave the guesses letters in the current state, only
  add a guessed letter if a letter is selected.
  2.  The game logic will only be given a character if the character is a letter

3.  Once the game logic gets a letter then it must do one of the two following items
  1.  The game logic will determine if the letter is part of the word and secondly it will determine which position
  in the word the letter appears, the game logic will also accommodate the appearance of the letter in more than
  one position in the word.
  2.  The game logic will also determine if the guessed letter is not a part of the word

4.  affect on the view when a letter is chosen
  1.  If the letter is part of the word, then all of the letter positions need to be filled in with where the
  letter appears
  2.  if the letter is not part of the word, an apple needs to fall from the tree

5.  concluding the game
  1.  if all of the guessed letters match the word then a message is displayed in p#message saying the person won,
  and the blue background fades in.
  2.  if all of the apples have fallen from the tree a message is displayed in p#message saying the person lost,
  and the red background fades in.
  3.  In both cases, a play again message appears.
  4.  if there are still words remaining, then a new game needs to be started
  5.  if there are no words remaining a flash message should appear which says the game is out of words
 */