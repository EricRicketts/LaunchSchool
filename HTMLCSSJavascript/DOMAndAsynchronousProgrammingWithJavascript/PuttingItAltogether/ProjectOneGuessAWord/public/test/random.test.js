import { randomWord } from '../code/javascript/random_word';

describe('Test random function', function () {
  let expected, results;
  it('should pick random words and decrement the array', function () {
    const originalWords = [
      'stipend', 'foolish', 'signal', 'constant', 'bedazzle',
      'unction', 'abort', 'abrogate', 'upload', 'bequeath',
      'brilliant', 'genius', 'admonish', 'zenith', 'constraint'
    ].map(word => word.toUpperCase());
    let w1 = randomWord();
    let w2 = randomWord();
    expected = [true, true, true];
    results = [originalWords.includes(w1), originalWords.includes(w2), (w1 !== w2)];

    expect(results).toEqual(expected);
  });
});