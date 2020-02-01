import { sumOfSums, sumOfSumsAlternate, sumOfSumsLaunchSchool } from "../code/sum_of_sums";

describe('Exercises JS210 Small Problems List Processing Exercise Four', function () {
  let array;
  
  it('for one element array just returns the only element', function () {
    array = [4];
    expect(sumOfSums(array)).toBe(4);
  });

  it('sums of sums two element array', function () {
    array = [9, 10];
    expect(sumOfSums(array)).toBe(28);
  });

  it('sum of sums for three element array', function () {
    array = [3, 5, 2];
    expect(sumOfSums(array)).toBe(21);
  });

  it('sum of sums for four element array', function () {
    array = [1, 5, 7, 3];
    expect(sumOfSums(array)).toBe(36);
  });

  it('sum of sums for five element array', function () {
    array = [1, 2, 3, 4, 5];
    expect(sumOfSums(array)).toBe(35);
  });

  it('alternate solution for one element array', function () {
    array = [4];
    expect(sumOfSumsAlternate(array)).toBe(4);
  });

  it('alternate solution on two element array', function () {
    array = [9, 10];
    expect(sumOfSumsAlternate(array)).toBe(28);
  });

  it('alternate solution for three element array', function () {
    array = [3, 5, 2];
    expect(sumOfSumsAlternate(array)).toBe(21);
  });

  it('alternate solution for four element array', function () {
    array = [1, 5, 7, 3];
    expect(sumOfSumsAlternate(array)).toBe(36);
  });

  it('alternate solution for five element array', function () {
    array = [1, 2, 3, 4, 5];
    expect(sumOfSumsAlternate(array)).toBe(35);
  });

  it('Launch School solution for one element array', function () {
    array = [4];
    expect(sumOfSumsLaunchSchool(array)).toBe(4);
  });

  it('Launch School solution on two element array', function () {
    array = [9, 10];
    expect(sumOfSumsLaunchSchool(array)).toBe(28);
  });

  it('Launch School solution for three element array', function () {
    array = [3, 5, 2];
    expect(sumOfSumsLaunchSchool(array)).toBe(21);
  });

  it('Launch School solution for four element array', function () {
    array = [1, 5, 7, 3];
    expect(sumOfSumsLaunchSchool(array)).toBe(36);
  });

  it('Launch School solution for five element array', function () {
    array = [1, 2, 3, 4, 5];
    expect(sumOfSumsLaunchSchool(array)).toBe(35);
  });
});