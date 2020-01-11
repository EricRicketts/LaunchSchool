import { swap } from "../code/swap";

describe('Exercises JS210 Javascript Language Fundamentals Easy Three Exercise Eight', function () {
  it('swaps first and last letter of each word in a phrase', function () {
    expect(swap('Oh what a wonderful day it is')).toBe('hO thaw a londerfuw yad ti si');
  });

  it('swaps first and last letters of a single word', function () {
    expect(swap('Abcde')).toBe('ebcdA');
  });

  it('returns a single letter', function () {
    expect(swap('a')).toBe('a');
  });
});