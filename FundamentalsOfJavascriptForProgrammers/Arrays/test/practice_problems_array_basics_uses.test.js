import { firstElementOf, firstNOf, lastElementOf,
  lastNOf, nthElementOf }
  from '../code/arrays_basic_uses.js';

describe('Practice Problems: Arrays Basic Uses', () => {
  var strAry, digits;

  beforeEach(() => {
    strAry = ['U', 'S', 'A', 'G', 'B', 'R'];
    digits = [4, 8, 15, 16, 23, 42];
  });

  it('firstElementOf returns first element of array', () => {
    expect(firstElementOf(strAry)).toBe('U');
  });

  it('lastElementOf returns last element of array', () => {
    expect(lastElementOf(strAry)).toBe('R');
  });

  it('nthElementOf returns designated element at index', () => {
    expect(nthElementOf(digits, 3)).toBe(16);
    expect(nthElementOf(digits, 8)).toBeUndefined();
    expect(nthElementOf(digits, -1)).toBeUndefined();
  });
  
  it('firstNOf returns the first N elements of the array', () => {
    const expected = [4, 8, 15];
    expect(firstNOf(digits, 3)).toEqual(expected);
  });

  it('lastNOf returns the last N elements of the array', () => {
    const expected = [16, 23, 42];  
    expect(lastNOf(digits, 3)).toEqual(expected);
  });
});