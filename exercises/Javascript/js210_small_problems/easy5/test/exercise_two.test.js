import { doubleConsonants } from "../code/double_char_part_two";

describe('Exercises JS210 Small Problems Easy Five Exercise Two', function () {
  var expected;

  it('doubles consonants only of a string of letters', function () {
    expected = 'SSttrrinngg';
    expect(doubleConsonants('String')).toBe(expected);
  });

  it('only repeats consontants in string of letters and other punctuation', function () {
    expected = 'HHellllo-WWorrlldd!';
    expect(doubleConsonants('Hello-World!')).toBe(expected);
  });

  it('only repeats consonants of string of letters and numbers', function () {
    expected = 'JJullyy 4tthh';
    expect(doubleConsonants('July 4th')).toBe(expected);
  });

  it('returns an empty string if input is an empty string', function () {
    expect(doubleConsonants('')).toBe('');
  });
});