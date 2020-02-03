import { substrings, substringsLaunchSchool } from "../code/all_substrings";

describe('Exercises JS210 Small Problems List Processing Exercise Six', function () {
  let str, expected;

  beforeEach(() => {
    str = 'abcde';
    expected = [
      "a", "ab", "abc", "abcd", "abcde",
      "b", "bc", "bcd", "bcde",
      "c", "cd", "cde",
      "d", "de",
      "e"
    ];
  })

  it('should produce an array of all possible substrngs', function () {
    expect(substrings(str)).toEqual(expected);
  });

  it('Launch School solution should produce an array of all possible substrngs', function () {
    expect(substringsLaunchSchool(str)).toEqual(expected);
  });
});