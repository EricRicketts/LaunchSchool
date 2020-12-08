import Game from '../code/javascript/game';

describe('Guess A Word Game Logic', function () {
  let game, results, expected;
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
      expected[5] = 'A';
      game.processGuessedLetter('A');
      results = game.validLetters;
      expect(results).toEqual(expected);
    });

    it('should place a single letter in multiple positions correctly', function () {
      [expected[1], expected[4]] = ['E', 'E'];
      game.processGuessedLetter('E');
      results = game.validLetters;
      expect(results).toEqual(expected);
    });

    it('A correct letter guessed twice will not change the valid letters array', function () {
      expected[3] = 'U';
      game.processGuessedLetter('U');
      results = [game.validLetters];
      game.processGuessedLetter('U');
      results.push(game.validLetters);
      expect(results).toEqual([expected, expected]);
    });
  });

  describe('Game Logic will increment incorrect guesses as necessary', function () {
    it('should increment the incorrect guesses if the letter guess is wrong', function () {
      expected = [0, 1];
      results = [game.incorrectGuesses];
      game.processGuessedLetter('D');
      results.push(game.incorrectGuesses);
      expect(results).toEqual(expected);
    });

    it('should not increment the incorrect guesses if the letter guess is correct', function () {
      expected = [0, 0];
      results = [game.incorrectGuesses];
      game.processGuessedLetter('B');
      results.push(game.incorrectGuesses);
      expect(results).toEqual(expected);
    });

    it('A letter previously guessed will not increment the incorrect letter guess count', function () {
      game.processGuessedLetter('Q');
      results = [game.incorrectGuesses];
      game.processGuessedLetter('X');
      results.push(game.incorrectGuesses);
      game.processGuessedLetter('Q');
      game.processGuessedLetter('X');
      results.push(game.incorrectGuesses);
      expected = [0, 1, 1];
      expect(results).toEqual(expected);
    });
  });

  describe('Game Logic updates the guessed letter array', function () {
    it('should update the guessed letter array if the letter is a new guess', function () {
      game.processGuessedLetter('E');
      game.processGuessedLetter('Z');
      expect(game.guessedLetters).toEqual(['E', 'Z']);
    });

    it('should not update the guessed letter array if the letter has already been guessed', function () {
      game.processGuessedLetter('T');
      game.processGuessedLetter('T');
      expect(game.guessedLetters).toEqual(['T']);
    });
  });

  describe('Game Logic determines if the game is over', function () {
    it('should indicate that the game is not over', function () {
      game.processGuessedLetter('B');
      game.processGuessedLetter('E');
      game.checkAndProcessGameCompletion();
      expect(game.over).toBe(false);
    });

    it('should indicate when the game is over with a player win', function () {
      expected = [true, { won: true, message: 'You won!!' }];
      ['B', 'E', 'Q', 'U', 'A', 'T', 'H'].forEach(letter => {
        game.processGuessedLetter(letter);
      });
      let wonObject = game.checkAndProcessGameCompletion();
      results = [game.over, wonObject];
      expect(results).toEqual(expected);
    });

    it('should indicate when the game is over with a player loss', function () {
      expected = [true, { won: false, message: 'Sorry, you lost.' }];
      ['B', 'E', 'X', 'D', 'S', 'Q', 'F', 'J', 'U', 'Z'].forEach(letter => {
        game.processGuessedLetter(letter);
      });
      let lostObject = game.checkAndProcessGameCompletion();
      results = [game.over, lostObject];
      expect(results).toEqual(expected);
    });
  });
});