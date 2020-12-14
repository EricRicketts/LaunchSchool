import { Game } from '../code/javascript/game';

describe('Guess A Word Game Logic', function () {
  let game, results, expected, letter, letterIndices, letters;
  beforeEach(() => {
    game = new Game();
    game.word = 'bequeath'.toUpperCase();
    game.letterSpacesForWord = game.word.length;
    game.validLetters = new Array(game.letterSpacesForWord);
  });

  describe('Game Logic determines if entered letter is part of the word', function () {
    it('should return true if the letter is in the word', function () {
      expect(game.isLetterInWord('E')).toBe(true);
    });

    it('should return false if the letter is not in the word', function () {
      expect(game.isLetterInWord('C')).toBe(false);
    });
  });

  describe('Game Logic will correctly place valid letter in letter array', function () {
    beforeEach(() => {
      expected = new Array(game.letterSpacesForWord);
    });

    it('should place a single letter correctly is a single position correctly', function () {
      letter = 'A'
      expected[5] = letter;
      letterIndices = game.findLetterPositionsInWord(letter);
      game.positionLetterInWord(letterIndices, letter);
      results = game.validLetters;
      expect(results).toEqual(expected);
    });

    it('should place a single letter in multiple positions correctly', function () {
      letter = 'E';
      [expected[1], expected[4]] = ['E', 'E'];
      letterIndices = game.findLetterPositionsInWord(letter);
      game.positionLetterInWord(letterIndices, letter);
      results = game.validLetters;
      expect(results).toEqual(expected);
    });
  });

  describe('Game Logic will add a letter to the guessed letters array', function () {
    it('A letter can be added', function () {
      expected = ['U'];
      game.addToGuesses('U');
      results = game.guessedLetters;
      expect(results).toEqual(expected);
    });

    it('A previously guessed letter can be identified', function () {
      letter = 'T';
      game.addToGuesses(letter);
      expect(game.hasLetterBeenPlayed(letter)).toBe(true);
    });
  });

  describe('Game can add to the incorrect guesses', function () {
    it('If the letter is not part of the word add to the incorrect guess count', function () {
      expected = [0, 1];
      results = [game.incorrectGuesses];
      letter = 'Z';
      game.incrementIncorrectGuesses();
      results.push(game.incorrectGuesses);
      expect(results).toEqual(expected);
    });
  });

  describe('Game can determine if there is a win or loss', function () {
    it('should determine a win', function () {
      expected = [false, false, false, false, false, false, true];
      results = [];
      letters = ['B', 'E', 'Q', 'U', 'E', 'A', 'T', 'H'].forEach(letter => {
        if (game.isLetterInWord(letter) && !game.hasLetterBeenPlayed(letter)) {
          game.addToGuesses(letter);
          letterIndices = game.findLetterPositionsInWord(letter);
          game.positionLetterInWord(letterIndices, letter);
          results.push(game.isWon())
        }
      });
      expect(results).toEqual(expected);
    });

    it('should determine a loss', function () {
      expected = [false, false, false, false, false, true];
      results = [];
      letters = ['B', 'X', 'Y', 'Z', 'T', 'S', 'D', 'F'].forEach(letter => {
        if (!game.isLetterInWord(letter) && !game.hasLetterBeenPlayed(letter)) {
          game.addToGuesses(letter);
          game.incrementIncorrectGuesses();
          results.push(game.isLost());
        }
      });
      expect(results).toEqual(expected);
    });
  });
});