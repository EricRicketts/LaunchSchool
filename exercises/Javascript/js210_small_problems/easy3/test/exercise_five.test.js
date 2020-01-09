import { isRealPalindrome } from "../code/palindrome";

describe('Exercises JS210 Small Problems Easy Three Exercise Five', function () {
  it('operates like a standard palindrome', function () {
    expect(isRealPalindrome('madam')).toBe(true);
  });

  it('is case insensitive', function () {
    expect(isRealPalindrome('Madam')).toBe(true);
  });

  it('only alphanumerics matter', function () {
    expect(isRealPalindrome("Madam I'm Adam")).toBe(true);
  });

  it('numerics work if string only', function () {
    expect(isRealPalindrome('356653')).toBe(true);
  });

  it('alphanumerics work', function () {
    expect(isRealPalindrome('356a653')).toBe(true);
  });

  it('flags false for non palidromic mix of numbers and letters', function () {
    expedt(isRealPalindrome('123ab321')).toBe(false);
  });
});