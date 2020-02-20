import { rotateRightMostDigits } from "../code/rotation_part_two";

describe('JS210 Small Problems Medium One Exercise Two', function () {
  let number, expected;
  beforeEach(() => {
    number = 735291;
  });
  it('should rotate one digit and leave the number intact', function () {
    expected = 735291;
    expect(rotateRightMostDigits(number, 1)).toBe(expected);
  });

  it('should rotate the last two digits of a six digit number', function () {
    expected = 735219;
    expect(rotateRightMostDigits(number, 2)).toBe(expected);
  });

  it('should rotate the last three digits of a six digit number', function () {
    expected = 735912;
    expect(rotateRightMostDigits(number, 3)).toBe(expected);
  });

  it('should rotate the last four digits of a six digit number', function () {
    expected = 732915;
    expect(rotateRightMostDigits(number, 4)).toBe(expected);
  });

  it('should rotate the last five digits of a six digit number', function () {
    expected = 752913;
    expect(rotateRightMostDigits(number, 5)).toBe(expected);
  });

  it('should rotate an entire six digit number', function () {
    expected = 352917;
    expect(rotateRightMostDigits(number, 6)).toBe(expected);
  });
});