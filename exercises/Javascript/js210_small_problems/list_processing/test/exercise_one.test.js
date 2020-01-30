import { sum } from '../code/sum';

describe('Exercises JS210 Small Problems List Processing Exercise One', function () {
  it('sums the digits of a two digit number', function () {
    expect(sum(23)).toBe(5);
  });

  it('sums the digits of a three digit number', function () {
    expect(sum(496)).toBe(19);
  });

  it('sums the digits of a large number', function () {
    expect(sum(123456789)).toBe(45);
  });

  it('sums the digits of a number even if zero is in the number', function () {
    expect(sum(205)).toBe(7);
  });
});