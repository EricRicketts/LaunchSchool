import { octalToDecimal, octalToDecimalLaunchSchool } from "../code/octal_to_decimal";

describe('LS215 List Processing And Functional Abstractions Practice Problem Three', function () {
  let str, expected;
  it('should have 1 octal equal 1 decimal', function () {
    str = '1';
    expected = 1;
    expect(octalToDecimal(str)).toBe(expected);
  });

  it('should have 10 octal equal 8 decimal', function () {
    str = '10';
    expected = 8;
    expect(octalToDecimal(str)).toBe(expected);
  });

  it('should have 130 octal equal 88 decimal', function () {
    str = '130';
    expected = 88;
    expect(octalToDecimal(str)).toBe(expected);
  });

  it('should have 17 octal equal 15 decimal', function () {
    str = '17';
    expected = 15;
    expect(octalToDecimal(str)).toBe(expected);
  });

  it('should have 2047 octal equal 1063 decimal', function () {
    str = '2047';
    expected = 1063;
    expect(octalToDecimal(str)).toBe(expected);
  });

  it('should have 11 octal equal 9 decimal, strips leading zeros', function () {
    str = '011';
    expected = 9;
    expect(octalToDecimal(str)).toBe(expected);
  });

  it('Launch School should have 1 octal equal 1 decimal', function () {
    str = '1';
    expected = 1;
    expect(octalToDecimalLaunchSchool(str)).toBe(expected);
  });

  it('Launch School should have 10 octal equal 8 decimal', function () {
    str = '10';
    expected = 8;
    expect(octalToDecimalLaunchSchool(str)).toBe(expected);
  });

  it('Launch School should have 130 octal equal 88 decimal', function () {
    str = '130';
    expected = 88;
    expect(octalToDecimalLaunchSchool(str)).toBe(expected);
  });

  it('Launch School should have 17 octal equal 15 decimal', function () {
    str = '17';
    expected = 15;
    expect(octalToDecimalLaunchSchool(str)).toBe(expected);
  });

  it('Launch School should have 2047 octal equal 1063 decimal', function () {
    str = '2047';
    expected = 1063;
    expect(octalToDecimalLaunchSchool(str)).toBe(expected);
  });

  it('Launch School should have 11 octal equal 9 decimal, strips leading zeros', function () {
    str = '011';
    expected = 9;
    expect(octalToDecimalLaunchSchool(str)).toBe(expected);
  });
});