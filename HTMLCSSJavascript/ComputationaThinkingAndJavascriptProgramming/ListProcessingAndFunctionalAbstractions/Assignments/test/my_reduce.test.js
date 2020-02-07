import { myReduce } from "../code/my_reduce";

describe('Reducing Lesson My Own Reduce', function () {
  let count, add, smallestNumber, longestWord, numArr, wordArr;

  beforeEach(() => {
    count = [1, 2, 3, 4, 5];
    numArr = [5, 12, 15, 1, 6];
    wordArr = ['abc', 'launch', 'targets', ''];
    add = function(sum, number) {
      return sum + number;
    };
    smallestNumber = function(smallest, number) {
      return smallest <= number ? smallest : number;
    };
    longestWord = function(longest, word) {
      return longest.length >= word.length ? longest : word;
    }
  });

  it('standard reduce should sum an array of numbers', function () {
    expect(count.reduce(add)).toBe(15);
  });

  it('standard reduce sums an array of numbers with an initial value', function () {
    expect(numArr.reduce(add, 10)).toBe(49);
  });

  it('standard reduce finds the smallest number in an array of numbers', function () {
     expect(numArr.reduce(smallestNumber)).toBe(1);
  });

  it('standard reduce finds the longest word in an array of words', function () {
    expect(wordArr.reduce(longestWord)).toBe('targets');
  });

  it('my own reduce should sum an array of numbers', function () {
    expect(myReduce(count, add)).toBe(15);
  });

  it('my own reduce sums an array of numbers with an initial value', function () {
    expect(myReduce(numArr, add, 10)).toBe(49);
  });

  it('my own reduce finds the smallest number in an array of numbers', function () {
    expect(myReduce(numArr, smallestNumber)).toBe(1);
  });

  it('my own reduce finds the longest word in an array of words', function () {
    expect(myReduce(wordArr, longestWord)).toBe('targets');
  });
});