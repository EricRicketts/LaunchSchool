import { words, random } from "../code/javascript/random";

describe('Test random function', function () {
  let expected, results;
  it('should pick random words and decrement the array', function () {
    let originalWords = [...words];
    let w1 = random();
    let w2 = random();
    expected = [8, true, true, true];
    results = [
      words.length, originalWords.includes(w1),
      originalWords.includes(w2), (w1 !== w2)
    ];

    expect(results).toEqual(expected);
  });
});