import { triangles } from "../code/tri_angles";

describe('JS210 Small Problems Medium Two Exercise Three', function () {
  it('should invalidate an angle of zero degrees', function () {
    expect(triangles(0, 90, 90)).toBe('invalid');
  });

  it('should invalidate angles which do not add up to 180', function () {
    expect(triangles(50, 50, 50)).toBe('invalid');
  });

  it('should identify a right triangle', function () {
    expect(triangles(30, 60, 90)).toBe('right');
  });

  it('should identify an obtuse triangle', function () {
    expect(triangles(120, 50, 10)).toBe('obtuse');
  });

  it('should identify and acute triangle', function () {
    expect(triangles(60, 70, 50)).toBe('acute');
  });
});
