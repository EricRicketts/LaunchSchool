import { featured } from "../code/featured_number";

describe('JS210 Small Problems Medium Two Exercise Five', function () {
  it('should find the next featured number after 12', function () {
    expect(featured(12)).toBe(21);
  });

  it('should find the next featured number after 20', function () {
    expect(featured(20)).toBe(21);
  });

  it('should find the next featured number after 21', function () {
    expect(featured(21)).toBe(35);
  });

  it('should find the next featured number after 997', function () {
    expect(featured(997)).toBe(1029);
  });

  it('should find the next featured number after 1029', function () {
    expect(featured(1029)).toBe(1043);
  });

  it('should find the next featured number after 999999', function () {
    expect(featured(999999)).toBe(1023547);
  });

  it('should find the next featured number after 999999987', function () {
    expect(featured(999999987)).toBe(1023456987);
  });
});