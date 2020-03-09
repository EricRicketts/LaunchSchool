import { fridayThe13ths } from "../code/unlucky_days";

describe('JS210 Small Problems Medium Two Exercise Four', function () {
  it('should flag one Friday the 13th for 1986', function () {
    expect(fridayThe13ths(1986)).toBe(1);
  });

  it('should flag three Friday the 13ths for 2015', function () {
    expect(fridayThe13ths(2015)).toBe(3);
  });

  it('should flag two Friday the 13ths for 2017', function () {
    expect(fridayThe13ths(2017)).toBe(2);
  });
});