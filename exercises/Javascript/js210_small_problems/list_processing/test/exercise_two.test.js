import { alphabeticNumberSort, alphabeticNumberSortLaunchSchool } from "../code/alphabetical_numbers";

describe('Exercises JS210 Small Problems List Processing Exercise Two ', function () {
  let inputOne, inputTwo, expectedOne, expectedTwo, result;

  beforeEach(() => {
    inputOne = [0, 5, 8, 13];
    inputTwo = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    expectedOne = [8, 5, 13, 0];
    expectedTwo = [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0];
  });

  it('sorts numbers based on the english word for each number, sort five numbers', function () {
    expect(alphabeticNumberSort(inputOne)).toEqual(expectedOne);
  });

  it('sorts the Launch School test data', function () {
    expect(alphabeticNumberSort(inputTwo)).toEqual(expectedTwo);
  });

  it('Launch School solution sorts five numbers', function () {
    result = alphabeticNumberSortLaunchSchool(inputOne);
    expect(result).toEqual(expectedOne);
  });

  it('Launch School solution sorts the Launch School test data', function () {
    expect(alphabeticNumberSortLaunchSchool(inputTwo)).toEqual(expectedTwo);
  });
});