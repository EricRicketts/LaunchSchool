import { isReserved, isReservedFixed } from "../code/reserved_keywords";

describe('JS210 Small Problems Debugging Exercise Two', function () {
  it('should make an error in identifying a keyword', function () {
    expect(isReserved('switch')).toBe(false); // ideally this should be true, switch is a keyword
  });

  it('should now identify a keyword', function () {
    expect(isReservedFixed('switch')).toBe(true);
  });

  it('should identify a word as not a keyword', function () {
    expect(isReservedFixed('monkey')).toBe(false);
  });
});