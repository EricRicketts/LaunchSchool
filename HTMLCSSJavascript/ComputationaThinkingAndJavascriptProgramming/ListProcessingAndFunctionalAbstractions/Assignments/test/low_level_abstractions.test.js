import { isAllUnique } from "../code/low_level_abstractions";

describe('LS215 Low Level Abstractions', function () {
  let str;
  it('should return false on a common phrase with repeated letters', function () {
    str = 'The quick brown fox jumped over a lazy dog';
    expect(isAllUnique(str)).toBe(false);
  });

  it('should return false with repeated punctuation marks', function () {
    str = '123,456,789';
    expect(isAllUnique(str)).toBe(false);
  });

  it('should return false on a common small phrase with repeated letters', function () {
    str = 'The big apple';
    expect(isAllUnique(str)).toBe(false);
  });

  it('should return false without regard to case', function () {
    str = 'The big apPlE';
    expect(isAllUnique(str)).toBe(false);
  });

  it('should return true with unique non-alphanumeric characters', function () {
    str = '!@#$%^&*()';
    expect(isAllUnique(str)).toBe(true);
  });

  it('should return true with the alphabet', function () {
    str = 'abcdefghijklmnopqrstuvwxyz';
    expect(isAllUnique(str)).toBe(true);
  });

});