import { getRandomInclusive, radiansToDegrees, toNegative } from '../code/math_object.js';

describe('Objects: Working With The Math Object', () => {
  var ary, input, expected, range, result;

  beforeEach(() => {
    range = [1, 2, 3, 4, 5];
  });

  it('convert radians to degrees', () => {
    expected = [45, 90, 135, 180];
    ary = [];
    input = [Math.PI/4, Math.PI/2, 3*Math.PI/4, Math.PI];
    input.forEach(n => {
      ary.push(radiansToDegrees(n));
    });
    expect(ary).toEqual(expected);
  });

  it('converts positive numbers to negative numbers or leaves negative numbers alone', () => {
    expected = [-5, -5];
    input = [5, -5];
    ary = [];
    input.forEach(n => {
      ary.push(toNegative(n));
    });
    expect(ary).toEqual(expected);
  });

  it('Math.sqrt', () => {
    expect(Math.sqrt(16777216)).toBe(4096);
  });

  it('Math.pow', () => {
    expect(Math.pow(16, 6)).toBe(16777216);
  });

  it('Math.floor, Math.ceil, Math.round', () => {
    expect(Math.floor(50.72)).toBe(50);
    expect(Math.ceil(49.2)).toBe(50);
    expect(Math.round(49.86)).toBe(50);
  });

  it('random numbers between min and max inclusive', () => {
    result = getRandomInclusive(1, 5);
    expect(range).toContain(result);
  });

  it('works if min and max are switched', () => {
    result = getRandomInclusive(5, 1);
    expect(range).toContain(result);
  });

  it('works if min and max are equal', () => {
    result = getRandomInclusive(5, 5);
    expect(range).toContain(result);
  });
});