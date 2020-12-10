import { randomWord } from "./random_word.js";

function Game() {
  this.word = randomWord();
  this.letterSpacesForWord = this.word.length;
  this.validLetters = new Array(this.letterSpacesForWord);
  this.incorrectGuesses = 0;
  this.guessedLetters = [];
  this.over = false;
}

Game.prototype.checkAndProcessGameCompletion = function() {
  let currentWordStatus = this.validLetters.join('');
  let gameWon = currentWordStatus === this.word && this.incorrectGuesses <= this.getAllowedIncorrectGuesses();
  let gameLost = currentWordStatus !== this.word && this.incorrectGuesses === this.getAllowedIncorrectGuesses();

  if (gameWon) {
    this.over = true;
    this.won = true;
    this.message = 'You won!!';
  } else if (gameLost) {
    this.over = true;
    this.won = false;
    this.message = 'Sorry, you lost.'
  }
}
Game.prototype.findLetterPositionsInWord = function(letter) {
  return this.word.split('').reduce((indices, wordLetter, index) => {
    if (wordLetter === letter) { indices.push(index); }
    return indices;
  }, []);
}
Game.prototype.getAllowedIncorrectGuesses = function() {
  return 6;
}
Game.prototype.isLetterInWord = function(letter) {
  return this.word.includes(letter);
}
Game.prototype.positionLetterInWord = function(letterIndices, letter) {
  letterIndices.forEach(letterIndex => {
    this.validLetters[letterIndex] = letter;
  });
}
Game.prototype.processGuessedLetter = function(letter) {
  let letterInWordAndNotAlreadyGuessed = this.isLetterInWord(letter) && !this.guessedLetters.includes(letter);
  let letterNotInWordAndNotAlreadyGuessed = !this.isLetterInWord(letter) && !this.guessedLetters.includes(letter);

  if (letterInWordAndNotAlreadyGuessed) {
    this.guessedLetters.push(letter);
    let letterIndices = this.findLetterPositionsInWord(letter);
    this.positionLetterInWord(letterIndices, letter);
  } else if (letterNotInWordAndNotAlreadyGuessed) {
    this.guessedLetters.push(letter);
    this.incorrectGuesses += 1;
  }
}
export { Game };
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
  1.  An empty array needs to be created which is the same length as the word.
  2.  If a letter is chosen and it is in the word then all of the indices need to be found where the letter exists,
  once these indices are found the empty letter array needs to be populated with the appropriate letters
  3.  If the chosen letter is not in the word then the incorrect guesses property needs to be incremented.
  4.  If the letter exists in the guessed Letters array then nothing should be done
  5.  A calculation needs to be done to see if the number of guesses exceeds the number of allowed incorrect guesses.
  6.  If the number equals the number of incorrect guesses and the word is not found then a message needs to be
  transmitted that the game is over.
  7.  A check needs to be done if the filled in letters equal the word in question then the game is over
*/