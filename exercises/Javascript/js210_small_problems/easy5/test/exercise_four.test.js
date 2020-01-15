import { centerOf } from "../code/get_middle_character";

describe('Exercises JS210 Small Problems Easy Five Exercise Four', function () {
  it('returns one character for middle of an odd length string', function () {
    expect(centerOf('I Love Javascript')).toBe('a');
  });

  it('returns center of string even if nonalphanumeric character', function () {
    expect(centerOf('Launch School')).toBe(' ');
  });

  it('returns two characters for an even string', function () {
    expect(centerOf('Launch')).toBe('un');
  });

  it('larger even string returns two characters', function () {
    expect(centerOf('Launchschool')).toBe('hs');
  });

  it('returns single character if string is single character', function () {
    expect(centerOf('x')).toBe('x');
  });
});