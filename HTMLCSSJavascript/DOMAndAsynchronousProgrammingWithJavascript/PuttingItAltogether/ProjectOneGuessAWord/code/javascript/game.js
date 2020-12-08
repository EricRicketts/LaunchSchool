import randomWord from "./random_word";

function Game() {
  this.word = randomWord();
  this.letterSpacesForWord = this.word.length;
  this.validLetters = new Array(this.letterSpacesForWord);
  this.incorrectGuesses = 0;
  this.guessedLetters = [];
}

Game.prototype.getAllowedIncorrectGuesses = function() {
  return 6;
}

export { Game as default };
/*
  what a Game object should track:
  1.  The current word for the game
  2.  The number of incorrect guesses
  3.  All of the letters guessed
  4.  total incorrect guesses allowed is 6

  constructor
  1.  choose a word from the words array as a word for the game
  2.  number of incorrect guesses should be initialize to 0
  3.  letters guessed should be initialized as an empty array
  4.  set total allowed incorrect guesses to 6
  5.  create blanks in the word container, they should equal the number of
  letters in the chosen word
*/

/*
  Game Play
  1.  Once the word is chosen then an array needs to be created which contains all of the letters in the word where
  each letter is upper cased.
  2.  An empty array needs to be created which is the same length as the word.
  3.  If a letter is chosen and it is in the word then all of the indices need to be found where the letter exists,
  once these indices are found the empty letter array needs to be populated with the appropriate letters
  4.  If the chosen letter is not in the word then the incorrect guesses property needs to be incremented.
  5.  A calculation needs to be done to see if the number of guesses exceeds the number of allowed incorrect guesses.
  6.  If the number equals the number of incorrect guesses and the word is not found then a message needs to be
  transmitted that the game is over.
  7.  A check needs to be done if the filled in letters equal the word in question then the game is over
*/