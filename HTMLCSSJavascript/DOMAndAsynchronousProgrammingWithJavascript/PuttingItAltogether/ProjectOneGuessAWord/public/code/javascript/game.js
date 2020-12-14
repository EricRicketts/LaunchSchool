import { randomWord } from "./random_word.js";

function Game() {
  let selectedWord = randomWord();
  if (selectedWord === undefined) {
    this.message = 'Sorry, the game has run out of words.'
    this.outOfWords = true;
    return this;
  }
  this.word = selectedWord;
  this.letterSpacesForWord = this.word.length;
  this.validLetters = new Array(this.letterSpacesForWord);
  this.incorrectGuesses = 0;
  this.guessedLetters = [];
}

Game.prototype.addToGuesses = function(letter) {
  this.guessedLetters.push(letter);
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
Game.prototype.incrementIncorrectGuesses = function() {
  this.incorrectGuesses += 1;
}
Game.prototype.isLetterInWord = function(letter) {
  return this.word.includes(letter);
}
Game.prototype.isLost = function() {
  return this.getAllowedIncorrectGuesses() - this.incorrectGuesses === 0;
}
Game.prototype.isWon = function() {
  return this.validLetters.join('') === this.word;
}
Game.prototype.hasLetterBeenPlayed = function(letter) {
  return this.guessedLetters.includes(letter);
}
Game.prototype.positionLetterInWord = function(letterIndices, letter) {
  letterIndices.forEach(letterIndex => {
    this.validLetters[letterIndex] = letter;
  });
}

export { Game };
