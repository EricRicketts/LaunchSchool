import { firstElementOf, lastElementOf } from '../code/arrays_basic_uses.js';

describe('Practice Problems: Arrays Basic Uses', () => {
  var strAry;
  beforeEach(() => {
    strAry = ['U', 'S', 'A', 'G', 'B', 'R'];
  });

  test('firstElementOf(arr) returns first element of array', () => {
    expect(firstElementOf(strAry)).toBe('U');
  });

  test('lastElementOf(arr) returns last element of array', () => {
    expect(lastElementOf(strAry)).toBe('R');
  });
});