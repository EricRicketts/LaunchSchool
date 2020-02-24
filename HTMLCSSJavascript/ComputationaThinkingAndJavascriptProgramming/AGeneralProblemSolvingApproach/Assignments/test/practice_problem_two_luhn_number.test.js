import { isValidLuhnNumber } from "../code/luhn_number";

describe('LS215 A General Problem Solving Approach Problem Two Luhn Number', function () {

  it('should accept a ten digit valid luhn number', function () {
    expect(isValidLuhnNumber('4191278904')).toBe(true);
  });

  it('should accept a valid ten digit luhn number with extra characters', function () {
    expect(isValidLuhnNumber('419a 127 - .8$- 904')).toBe(true);
  });

  it('should accept a valid twenty digit luhn number', function () {
    expect(isValidLuhnNumber('48744494486593735716')).toBe(true);
  });

  it('should reject an invalid 10 digit luhn number', function () {
    expect(isValidLuhnNumber('1323214296')).toBe(false);
  });

  it('should reject an invalid 20 digit luhn number', function () {
    expect(isValidLuhnNumber('50712682778888834229')).toBe(false);
  });

  it('should reject an empty string', function () {
    expect(isValidLuhnNumber('')).toBe(false);
  });
});