import { triangle } from "../code/triangle_sides";

describe('JS210 Small Problems Medium Two Exercise Two', function () {
  it('should flag a triangle as invalid with a side with length 0', function () {
    expect(triangle(0, 3, 3)).toBe('invalid');
  });

  it('should flag invalid if sum of two shorter sides is not bigger than the longest side', function () {
    expect(triangle(1, 1, 3)).toBe('invalid');
  });

  it('should identify and equilateral triangle', function () {
    expect(triangle(3, 3,3)).toBe('equilateral');
  });

  it('should identify an isosceles triangle', function () {
    expect(triangle(3, 3, 1.5)).toBe('isosceles');
  });

  it('should identify and scalene triangle', function () {
    expect(triangle(3, 4, 5)).toBe('scalene');
  });
});