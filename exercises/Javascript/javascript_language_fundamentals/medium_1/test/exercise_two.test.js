describe('Exercises: JS210: Javascript Language Fundamentals: Medium 1: Exercise Two', function () {
  it('should populate an array of numbers divisible by 3', function () {
    var result = [];
    var expected = [3, 6, 9];
    var i = 0;
    while (i < 10) {
      if (i !== 0 && i % 3 === 0) { result.push(i); }
      i += 1;
    }
    expect(result).toEqual(expected);
  });
});
/*
Note if we had an if else in the while we would have an infinite loop
and the result array would only be filled with 0's, this was the
original Launch School Problem.

while (i < 10) {
  if (i % 3 === 0) {
    result.push(i);
  } else {
  i += 1;
  }
}
 */