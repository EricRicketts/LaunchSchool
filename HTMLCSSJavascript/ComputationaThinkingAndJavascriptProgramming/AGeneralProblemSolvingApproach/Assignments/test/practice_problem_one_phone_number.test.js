import { cleanUpPhoneNumber } from "../code/phone_number";

describe('LS215 A General Problem Solving Approach Practice One Demonstration', function () {
  let badNumber;
  beforeEach(() => {
    badNumber = '0000000000';
  });

  it('should reject numbers less than 10 digits', function () {
    expect(cleanUpPhoneNumber('(703)451-02')).toBe(badNumber);
  });

  it('should reject numbers greater than 11 digits', function () {
    expect(cleanUpPhoneNumber('703 451.023567')).toBe(badNumber);
  });

  it('should accept an 11 digit number with a leading 1', function () {
    expect(cleanUpPhoneNumber('1-703 451.0235')).toBe('7034510235');
  });

  it('should reject an 11 digit number with something other than a leading 1', function () {
    expect(cleanUpPhoneNumber('2.703 451-0235')).toBe(badNumber);
  });

  it('should accept a 10 digit number', function () {
    expect(cleanUpPhoneNumber('(703)451-0235')).toBe('7034510235');
  });

  it('should reject an empty string', function () {
    expect(cleanUpPhoneNumber('')).toBe(badNumber);
  });

  it('should accept a valid digit only number', function () {
    expect(cleanUpPhoneNumber('17034510235')).toBe('7034510235');
  });
});