import { Game } from '../code/javascript/game';

describe('Guess A Word Game Initialization', function () {
  let game, originalWords, maxWordLength, minWordLength, results, expected;
  beforeAll(() => {
    game = new Game();
    originalWords = [
      'stipend', 'foolish', 'signal', 'constant', 'bedazzle',
      'unction', 'abort', 'abrogate', 'upload', 'bequeath'
    ].map(word => word.toUpperCase());
    maxWordLength = 0;
    originalWords.forEach(word => {
      maxWordLength = word.length > maxWordLength ? word.length : maxWordLength;
    });
    minWordLength = Infinity;
    originalWords.forEach(word => {
      minWordLength = word.length < minWordLength ? word.length : minWordLength;
    });
  });

  describe('Game Initialization', function () {
    it('should have one of the random words as a property', function () {
      expect(originalWords).toContain(game.word);
    });

    it('chosen word length should be within the range of all word lengths in the array ', function () {
      let chosenWordLength = game.letterSpacesForWord;
      expect(chosenWordLength >= minWordLength  && chosenWordLength <= maxWordLength).toBe(true);
    });

    it('should initialize incorrect guesses to zero', function () {
      expect(game.incorrectGuesses).toBe(0);
    });

    it('should initialize guessed letters to an empty array', function () {
      expect(Array.isArray(game.guessedLetters) && game.guessedLetters.length === 0).toBe(true);
    });

    it('should initialize an empty array to the same length as the word', function () {
      let emptyArrayInit = game.validLetters.length === game.letterSpacesForWord &&
        game.validLetters.every(letter => letter === undefined);
      expect(emptyArrayInit).toBe(true);
    });
  });
});
