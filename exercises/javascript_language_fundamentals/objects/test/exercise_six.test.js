describe('Exercises: Javascript Language Fundamentals: Objects: Exercise Six', () => {
  var myArray, average, refactoredAverage;

  beforeEach(() => {
    myArray = [5, 5];
    myArray[-1] = 5;
    myArray[-2] = 5;

    average = function(array) {
      var sum = 0;
      var i;

      for (i = -2; i < array.length; i += 1) {
        sum += array[i];
      }

      return sum / array.length;
    }

    refactoredAverage = function(array) {
      return array.reduce((sum, n) => {
        return sum += n;
      }, 0) / array.length;
    };
  });

  it('Array length is only over indexed items', () => {
    expect(average(myArray)).toBe(10);
  });

  it('Refactor only accounts for indexed items', () => {
    expect(refactoredAverage(myArray)).toBe(5);
  });
});
/*
the problem with this code is that the function iterates over the non-indexed
properties and addes those property values to the sum.  However, the length
property only gives the array length based on indexed properties, thus the
developer might have expected to get 5 as the average but got 10 instead.
*/
