import { maxRotation } from "../code/rotation_part_three";

describe('JS210 Small Problems Medium One Exercise Three', function () {
  let number, expected;
  it('should max rotate a six digit number', function () {
    number = 735291;
    expected = 321579;
    expect(maxRotation(number)).toBe(expected);
  });

  it('should leave a single digit number intact', function () {
    expect(maxRotation(3)).toBe(3);
  });

  it('should reverse the digits of a two digit number', function () {
    number = 35;
    expected = 53;
    expect(maxRotation(number)).toBe(expected);
  });

  it('should max rotate a large number', function () {
    number = 8703529146;
    expected = 7321609845;
    expect(maxRotation(number)).toBe(expected);
  });

  it('should drop the leading zero if one is present', function () {
    number = 105;
    expected = 15;
    expect(maxRotation(number)).toBe(expected);
  });
});