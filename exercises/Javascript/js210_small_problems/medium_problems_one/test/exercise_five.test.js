import { wordToDigit } from "../code/word_to_digit";

describe('JS210 Small Problems Medium One Exercise Five', function () {
  it('should return actual numbers for the word counterpart', function () {
    let phrase = 'Please call me at five five five one two three four. Thanks.';
    let expected = 'Please call me at 5 5 5 1 2 3 4. Thanks.';

    expect(wordToDigit(phrase)).toBe(expected);
  });
});