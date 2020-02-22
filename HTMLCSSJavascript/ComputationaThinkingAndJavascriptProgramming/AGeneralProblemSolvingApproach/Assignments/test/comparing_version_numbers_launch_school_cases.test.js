import { compareVersions } from "../code/comparing_version_numbers";

describe('LS214 A General Approach To Problem Solving Comparing Versions Launch School Tests', function () {
  it('should compare single digits versions as the same', function () {
     expect(compareVersions('1', '1')).toBe(0);
  });

  it('should compares two digit versions where first is greater than second', function () {
     expect(compareVersions('1.1', '1.0')).toBe(1);
  });

  it('should compares three digit versions where the first is less than second', function () {
     expect(compareVersions('2.3.4', '2.3.5')).toBe(-1);
  });

  it('should flag a version number with a letter in it', function () {
     expect(compareVersions('1.a', '1')).toBe(null);
  });

  it('should flag a version number with no number after a dot', function () {
     expect(compareVersions('1.', '1')).toBe(null);
  });

  it('should flag a version number with no number before dot', function () {
     expect(compareVersions('.1', '1')).toBe(null);
  });

  it('should flag a version number with two dots in succession', function () {
     expect(compareVersions('1..0', '2.0')).toBe(null);
  });

  it('should equate versions with equal parts though one has fewer parts', function () {
     expect(compareVersions('1.0', '1.0.0')).toBe(0);
  });

  it('should select a lesser version even though it has more parts', function () {
     expect(compareVersions('1.0.0', '1.1')).toBe(-1);
  });

  it('should select a lesser version when it has fewer parts', function () {
     expect(compareVersions('1.0', '1.0.5')).toBe(-1);
  });
});