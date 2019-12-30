import { repeatedCharacters } from '../code/repeated_characters.js';

describe('JS210: Javascript Language Fundamentals: Objects: Practice Problems: Repeated Characters', () => {
  var input, expected;

  beforeEach(() => {
    input = ['Programming', 'Combination', 'Paper', 'Baseless'];
    expected = [
      { r: 2, g: 2, m: 2 }, { o:2, i: 2, n: 2 },
      { p: 2 }, { s: 3, e: 2 }
    ];
  });
  it("Identifies repeated characters", () => {
    var result = [];
    input.forEach(str => {
      result.push(repeatedCharacters(str));
    });
    expect(result).toEqual(expected);
  });

  it('returns an empty object with no repeated characters', () => {
    expect(repeatedCharacters('Pet')).toEqual({});
  });
});