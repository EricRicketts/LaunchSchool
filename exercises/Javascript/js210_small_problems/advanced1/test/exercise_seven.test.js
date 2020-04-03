import { binarySearch } from "../code/binary_serach";

describe('JS210 Small Problems Advanced One Exercise Seven', function () {
  let arr, yellowPages, names, searchValue, expected;
  beforeEach(() => {
    arr = [1, 5, 7, 11, 23, 45, 65, 89, 102];
    yellowPages = [
      'Apple Store', 'Bags Galore', 'Bike Store', 'Donuts R Us', 'Eat a Lot',
      'Good Food', 'Pasta Place', 'Pizzeria', 'Tiki Lounge', 'Zooper'
    ];
    names = ['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'];
  });

  it('should find the second to last value in number list', function () {
    searchValue = 89;
    expected = 7;
    expect(binarySearch(arr, searchValue)).toBe(expected);
  });

  it('should find the last value in the number list', function () {
    searchValue = 102;
    expected = 8;
    expect(binarySearch(arr, searchValue)).toBe(expected);
  });

  it('should find the second value in the number list', function () {
    searchValue = 5;
    expected = 1;
    expect(binarySearch(arr, searchValue)).toBe(expected);
  });

  it('should find the first value in the number list', function () {
    searchValue = 1;
    expected = 0;
    expect(binarySearch(arr, searchValue)).toBe(expected);
  });

  it('should find the seventh value in the number list', function () {
    searchValue = 65;
    expected = 6;
    expect(binarySearch(arr, searchValue)).toBe(expected);
  });

  it('should find the sixth value in the number list', function () {
    searchValue = 45;
    expected = 5;
    expect(binarySearch(arr, searchValue)).toBe(expected);
  });

  it('should find the fourth value in the number list', function () {
    searchValue = 11;
    expected = 3;
    expect(binarySearch(arr, searchValue)).toBe(expected);
  });

  it('should find the third value in the number list', function () {
    searchValue = 7;
    expected = 2;
    expect(binarySearch(arr, searchValue)).toBe(expected);
  });

  it('should find the value in the middle of the number list', function () {
    searchValue = 23;
    expected = 4;
    expect(binarySearch(arr, searchValue)).toBe(expected);
  });

  it('should return -1 if the number is not in the list on the upper end', function () {
     searchValue = 100;
     expected = -1;
     expect(binarySearch(arr, searchValue)).toBe(expected);
  });

  it('should return -1 if the number is not in the list on the lower end', function () {
    searchValue = 13;
    expected = -1;
    expect(binarySearch(arr, searchValue)).toBe(expected);
  });

  it('should find "Pizzeria" in the yellow pages', function () {
    searchValue = 'Pizzeria';
    expected = 7;
    expect(binarySearch(yellowPages, searchValue)).toBe(expected);
  });

  it('should find "Apple Store" in the yellow pages', function () {
    searchValue = 'Apple Store';
    expected = 0;
    expect(binarySearch(yellowPages, searchValue)).toBe(expected);
  });

  it('should not find "Neman Marcus" in the yellow pages', function () {
    searchValue = 'Neman Marcus';
    expected = -1;
    expect(binarySearch(yellowPages, searchValue)).toBe(expected);
  });

  it('should not find "Peter" in names', function () {
    searchValue = 'Peter';
    expected = -1;
    expect(binarySearch(names, searchValue)).toBe(expected);
  });

  it('should find "Tyler" in names', function () {
    searchValue = 'Tyler';
    expected = 6;
    expect(binarySearch(names, searchValue)).toBe(expected);
  });
});