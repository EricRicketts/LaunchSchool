import { substringsAtStart, substringsAtStartAlternate } from "../code/leading_substrings";

describe('Exercises JS210 Small Problems List Processing Exercise Five', function () {
  it('all possible substrings for a three character string', function () {
    expect(substringsAtStart('abc')).toEqual(['a', 'ab', 'abc']);
  });

  it('one character string should be a one character substring', function () {
    expect(substringsAtStart('a')).toEqual(['a']);
  });

  it('five character string produces five substrings', function () {
    expect(substringsAtStart('xyzzy')).toEqual(['x', 'xy', 'xyz', 'xyzz', 'xyzzy']);
  });

  it('alternate, all possible substrings for a three character string', function () {
    expect(substringsAtStartAlternate('abc')).toEqual(['a', 'ab', 'abc']);
  });

  it('alternate, one character string should be a one character substring', function () {
    expect(substringsAtStartAlternate('a')).toEqual(['a']);
  });

  it('alternate, five character string produces five substrings', function () {
    expect(substringsAtStartAlternate('xyzzy')).toEqual(['x', 'xy', 'xyz', 'xyzz', 'xyzzy']);
  });
});