import { isUppercase, isUppercaseLaunchSchool } from "../code/upper_case_check";

describe('Exercises JS210 Small Problems String And Text Processing Exercise One', function () {
  let str;
  it('single lowercase letter is false', function () {
    str = 't';
    expect(isUppercase(str)).toBe(false); 
  });

  it('single uppercase letter is true', function () {
    str = 'T';
    expect(isUppercase(str)).toBe(true);
  });

  it('mix if only uppercase and lowercase is false', function () {
    str = 'Four Score';
    expect(isUppercase(str)).toBe(false);
  });

  it('all uppercase string is true', function () {
    str = 'FOUR SCORE';
    expect(isUppercase(str)).toBe(true);
  });

  it('true if letters are all uppercase since non-alphabetic characters are ignored', function () {
    str = '4SCORE!';
    expect(isUppercase(str)).toBe(true);
  });

  it('empty string is true', function () {
   str = '';
   expect(isUppercase(str)).toBe(true);
  });

  it('Launch School single lowercase letter is false', function () {
    str = 't';
    expect(isUppercaseLaunchSchool(str)).toBe(false);
  });

  it('Launch School single uppercase letter is true', function () {
    str = 'T';
    expect(isUppercaseLaunchSchool(str)).toBe(true);
  });

  it('Launch School mix if only uppercase and lowercase is false', function () {
    str = 'Four Score';
    expect(isUppercaseLaunchSchool(str)).toBe(false);
  });

  it('Launch School all uppercase string is true', function () {
    str = 'FOUR SCORE';
    expect(isUppercaseLaunchSchool(str)).toBe(true);
  });

  it('Launch School true if letters are all uppercase since non-alphabetic characters are ignored', function () {
    str = '4SCORE!';
    expect(isUppercaseLaunchSchool(str)).toBe(true);
  });

  it('Launch School empty string is true', function () {
    str = '';
    expect(isUppercaseLaunchSchool(str)).toBe(true);
  });
});