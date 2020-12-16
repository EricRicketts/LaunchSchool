function Controller(game, view) {
  this.game = game;
  this.view = view;
}

Controller.prototype = {
  constructor: Controller,
  init: function() {
    if (this.game.outOfWords) {
      this.view.outOfWords();
      return;
    }
    this.bind();
    this.view.init(this.game.letterSpacesForWord);
  },
  bind: function() {
    this.processGuessHandler = (event) => this.processGuess(event);
    this.view.document.addEventListener('keyup', this.processGuessHandler);
  },
  lose: function() {
    this.unbind();
    this.view.displayLoss();
  },
  processCorrectGuess: function(letter) {
    this.game.addToGuesses(letter);
    let letterIndices = this.game.findLetterPositionsInWord(letter);
    this.game.positionLetterInWord(letterIndices, letter);
    this.view.updateSpaces(this.game.validLetters);
    this.view.updateGuesses(letter);
    if (this.game.isWon()) { this.win(); }
  },
  processGuess: function(event) {
    let charCode = event.key.charCodeAt(0);
    let letter = event.key.toUpperCase();
    if (this.notALetter(charCode) || this.game.hasLetterBeenPlayed(letter)) { return; }
    this.game.isLetterInWord(letter) ? this.processCorrectGuess(letter) : this.processIncorrectGuess(letter);
  },
  processIncorrectGuess: function(letter) {
    this.game.addToGuesses(letter);
    this.game.incrementIncorrectGuesses();
    this.view.updateGuesses(letter);
    this.view.updateRemainingGuesses(this.game.incorrectGuesses);
    if (this.game.isLost()) { this.lose(); }
  },
  notALetter: function(charCode) {
    const LetterACharCode = 97;
    const LetterZCharCode = 122;
    return charCode < LetterACharCode || charCode > LetterZCharCode;
  },
  unbind: function() {
    this.view.document.removeEventListener('keyup', this.processGuessHandler);
  },
  win: function() {
    this.unbind();
    this.view.displayWin();
  }
}
export { Controller };