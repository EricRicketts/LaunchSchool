import { compareVersions } from "../code/comparing_version_numbers";

describe('LS215 A General Problem Solving Approach Comparing Version Numbers', function () {
  it('should flag invalid version numbers', function () {
    expect(compareVersions('1.1', '3.a')).toBe(null);
    expect(compareVersions('#.2', '3.2')).toBe(null);
  });
  it('should compare single digit and two digit version numbers', function () {
    expect(compareVersions('0.1', '1')).toBe(-1);
  });

  it('should compare versions 1 and 1.0 as the same', function () {
    expect(compareVersions('1', '1.0')).toBe(0);
  });

  it('should say version 1.0 is less than version 1.1', function () {
    expect(compareVersions('1.0', '1.1')).toBe(-1);
  });

  it('should say version 1.2 is greater than version 1.1', function () {
    expect(compareVersions('1.2', '1.1')).toBe(1);
  });

  it('should compare version 1.2.0.0 and 1.2 as the same', function () {
    expect(compareVersions('1.2.0.0', '1.2')).toBe(0);
  });

  it('should say version 1.18.2 is greater than 1.2.0.0', function () {
    expect(compareVersions('1.18.2', '1.2.0.0')).toBe(1);
  });

  it('should say version 1.18.2 is less than version 13.37', function () {
    expect(compareVersions('1.18.2', '13.37')).toBe(-1);
  });
});