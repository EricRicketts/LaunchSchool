const arraysEqual = require('./compare_arrays');

describe('Pratice Problem: Comparing Arrays', () => {
  it('should compare two equal single element arrays', () => {
      expect(arraysEqual([1], [1])).toBeTruthy();
  });

  it('should compare two nonequal single element arrays', () => {
    expect(arraysEqual([1], [2])).toBeFalsy();
  });

  it('should return false for two arrays of different length', () => {
    expect(arraysEqual([1, 2], [1, 2, 3])).toBeFalsy();
  });

  it('should return true even if elements are different data types', () => {
    expect(arraysEqual([1, 'hi', true], [1, 'hi', true])).toBeTruthy();
  });

  it('should return false if booleans are different', () => {
    expect(arraysEqual([1, 'hi', true], [1, 'hi', false])).toBeFalsy();
  });

  it('should return false if strings are different', () => {
    expect(arraysEqual([1, 'hi', true], [1, 'hello', true])).toBeFalsy();
  });

  it('should return false if numbers are different', () => {
    expect(arraysEqual([1, 'hi', true], [2, 'hi', true])).toBeFalsy();
  });
});