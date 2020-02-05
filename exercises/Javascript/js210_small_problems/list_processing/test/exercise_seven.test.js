import { palindromes } from "../code/palindromic_strings";

describe('Exercises JS210 Small Problems List Processing Exercise Seven', function () {
  let str, expected;

  it('returns empty array if no palindromic substrings exist', function () {
    str = 'abcd';
    expect(palindromes(str)).toEqual([]);
  });

  it('the string \'madam\' has two palindromic substrings', function () {
    str = 'madam';
    expected = ['madam', 'ada'];
    expect(palindromes(str)).toEqual(expected);
  });

  it('creates palindromes for a much larger string', function () {
    str = 'hello-madam-did-madam-goodbye';
    expected = [
      "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
      "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
      "-madam-", "madam", "ada", "oo"
    ];
    expect(palindromes(str)).toEqual(expected);
  });

  it('creates palindromes for the string \'knitting cassettes\'', function () {
    str = 'knitting cassettes';
    expected = ["nittin", "itti", "tt", "ss", "settes", "ette", "tt"];
    expect(palindromes(str)).toEqual(expected);
  });
});