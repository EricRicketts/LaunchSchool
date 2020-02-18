import { isBalanced } from "../code/matching_parentheses";

describe('LS215 String And Text Processing Practice Problem Matching Parentheses', function () {
  let str;
  it('should validate a single matched pair of parentheses', function () {
    str = 'What (is) this?';
    expect(isBalanced(str)).toBe(true);
  });

  it('should invalidate a single close parentheses', function () {
    str = 'What is) this?';
    expect(isBalanced(str)).toBe(false);
  });

  it('should invalidate a single open parentheses', function () {
    str = 'What (is this?';
    expect(isBalanced(str)).toBe(false);
  });

  it('should validate three matched pairs of parentheses', function () {
    str = '((What) (is this))?';
    expect(isBalanced(str)).toBe(true);
  });

  it('should invalidate an extra close parentheses', function () {
    str = '((What)) (is this))?';
    expect(isBalanced(str)).toBe(false);
  });

  it('should validate a no parentheses', function () {
    str = 'Hey!';
    expect(isBalanced(str)).toBe(true);
  });

  it('should invalidate a single matched pair of parentheses not in the right order', function () {
    str = ')Hey!(';
    expect(isBalanced(str)).toBe(false);
  });

  it('should invalidate equal number of open and close parentheses but out of order', function () {
    str = 'What ((is))) up(';
    expect(isBalanced(str)).toBe(false);
  });
});