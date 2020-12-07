import { words, randomWord } from "../code/javascript/random_word";

describe('Test random function', function () {
  let expected, results;
  it('should pick random words and decrement the array', function () {
    let originalWords = [
      'stipend', 'foolish', 'signal', 'constant', 'bedazzle',
      'unction', 'abort', 'abrogate', 'upload', 'bequeath'
    ];
    let w1 = randomWord();
    let w2 = randomWord();
    expected = [8, true, true, true];
    results = [
      words.length, originalWords.includes(w1), originalWords.includes(w2), (w1 !== w2)
    ];

    expect(results).toEqual(expected);
  });
});