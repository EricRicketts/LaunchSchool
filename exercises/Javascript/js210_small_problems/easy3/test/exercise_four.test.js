import { isPalindrome } from "../code/palindrome";

describe('Exercises JS210 Small Problems Easy Three Exercise Four', function () {
  it('identifies a palindrome', function () {
    expect(isPalindrome('madam')).toBe(true);
  });

  it('is case sensitive', function () {
    expect(isPalindrome('Madam')).toBe(false);
  });

  it('all characters matter', function () {
    expect(isPalindrome("madam i'm adam")).toBe(false)
  });

  it('works with numbers if they are strings', function () {
    expect(isPalindrome('356653')).toBe(true);
  });
});