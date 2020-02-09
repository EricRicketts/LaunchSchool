import { letterCaseCount, letterCaseCountLaunchSchool } from "../code/lettercase_counter";

describe('Exercises JS210 Small Problems String And Text Processing Exercise Three', function () {
  let str, expected;
  it('records upper, lower, neither in mix of upper, lower, and numbers', function () {
    str = 'abCdef 123';
    expected = { lowercase: 5, uppercase: 1, neither: 4 };
    expect(letterCaseCount(str)).toEqual(expected);
  });

  it('records upper, lower, neither in mix of upper, lower, and non-numeric characters', function () {
    str = 'AbCd +Ef';
    expected = { lowercase: 3, uppercase: 3, neither: 2 };
    expect(letterCaseCount(str)).toEqual(expected);
  });

  it('records neither for all numeric', function () {
    str = '123';
    expected = { lowercase: 0, uppercase: 0, neither: 3 };
    expect(letterCaseCount(str)).toEqual(expected);
  });

  it('records all zeros for empty string', function () {
    str = '';
    expected = { lowercase: 0, uppercase: 0, neither: 0 };
    expect(letterCaseCount(str)).toEqual(expected);
  });

  it('LS Solution records upper, lower, neither in mix of upper, lower, and numbers', function () {
    str = 'abCdef 123';
    expected = { lowercase: 5, uppercase: 1, neither: 4 };
    expect(letterCaseCountLaunchSchool(str)).toEqual(expected);
  });

  it('LS Solution records upper, lower, neither in mix of upper, lower, and non-numeric characters', function () {
    str = 'AbCd +Ef';
    expected = { lowercase: 3, uppercase: 3, neither: 2 };
    expect(letterCaseCountLaunchSchool(str)).toEqual(expected);
  });

  it('LS Solution records neither for all numeric', function () {
    str = '123';
    expected = { lowercase: 0, uppercase: 0, neither: 3 };
    expect(letterCaseCountLaunchSchool(str)).toEqual(expected);
  });

  it('LS Solution records all zeros for empty string', function () {
    str = '';
    expected = { lowercase: 0, uppercase: 0, neither: 0 };
    expect(letterCaseCountLaunchSchool(str)).toEqual(expected);
  });
});