import { isPalindromicNumber } from "../code/palindrome";

describe('Exercises JS210 Small Problems Easy Three Exercise Six', function () {
  it('accepts only numbers', function () {
    expect(isPalindromicNumber('123ab456')).toBe(false);
  });

  it('works on raw numbers', function () {
    expect(isPalindromicNumber(34543)).toBe(true);
  });

  it('flags false on raw numbers', function () {
    expect(isPalindromicNumber(123210)).toBe(false);
  });

  it('true on identical digits', function () {
    expect(isPalindromicNumber(22)).toBe(true);
  });

  it('works on a single digit', function () {
    expect(isPalindromicNumber(5)).toBe(true);
  });
});