import randomWord from "../code/javascript/random_word";

describe('Check if default export works', function () {
  it('should return from the words array', function () {
    let originalWords = [
      'stipend', 'foolish', 'signal', 'constant', 'bedazzle',
      'unction', 'abort', 'abrogate', 'upload', 'bequeath'
    ];
    let word = randomWord();
    expect(originalWords).toContain(word);
  });

  it('words array should not be accessible', function () {
    expect(() => { words; }).toThrow(ReferenceError);
  });
});