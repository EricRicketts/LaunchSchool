import { reverseNumber } from "../code/reverse_number";

describe('Exercises JS210 Small Problems Easy Five Exercise Three', function () {
  var expected;
  it('reverses an integer', function () {
    expected = 54321;
    expect(reverseNumber(12345)).toBe(expected);
  });

  it('reverse another integer', function () {
    expected = 31221;
    expect(reverseNumber(12213)).toBe(expected);
  });

  it('reverses a three digit integer', function () {
    expected = 654;
    expect(reverseNumber(456)).toBe(expected);
  });

  it('reversed number removes leading zeros', function () {
    expected = 21;
    expect(reverseNumber(12000)).toBe(expected);
  });

  it('returns a single digit number', function () {
    expected = 1;
    expect(reverseNumber(1)).toBe(1);
  });
});