import { objectsEqual } from "../code/object_equality";

describe('Exercises JS225 Object Oriented Javascript Objects Exercise Three', function () {
  let first, second;
  it('should return true of objects have the same keys and values', function () {
    first = { a: 'foo' };
    second = { a: 'foo' };
    expect(objectsEqual(first, second)).toBe(true);
  });

  it('should return false if the number of keys are different', function () {
    first = { a: 'foo', b: 'bar' };
    second = { a: 'foo' };
    expect(objectsEqual(first, second)).toBe(false);
  });

  it('should return true for empty objects', function () {
    expect(objectsEqual({}, {})).toBe(true);
  });

  it('should return false for same number of keys but different keys', function () {
    first = { a: 'foo', b: undefined };
    second = { a: 'foo', c: 1 };
    expect(objectsEqual(first, second)).toBe(false);
  });
});