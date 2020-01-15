import { repeater } from "../code/double_char_part_one";

describe('Exercises JS210 Small Problems Easy Five Exercise One', function () {
  var expected;
  it('repeats characters of letters only', function () {
    expected = 'HHeelllloo';
    expect(repeater('Hello')).toBe(expected);
  });

  it('repeats characters of letters and spaces and punctuation', function () {
    expected = 'GGoooodd  jjoobb!!';
    expect(repeater('Good job!')).toBe(expected);
  });

  it('returns empty string if input is empty string', function () {
    expected = '';
    expect(repeater('')).toBe(expected);
  });
});