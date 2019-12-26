describe('Exercises: Javascript Language Fundamentals: Objects: Exercise Five', () => {
  var myArray, expected, result;

  beforeEach(() => {
    myArray = ['a', 'b', 'c'];
  });

  it('array elements are accessed by non-zero array indices', () => {
    expected = ['a', 'b', 'c'];
    result = [myArray[0], myArray[1], myArray[2]];
    expect(result).toEqual(expected);
  });

  it('cannot access arrays with negative indices', () => {
    expect(myArray[-1]).toBeUndefined();
  });

  it('nonindexed items are added as object properties', () => {
    myArray[-1] = 'd';
    myArray['e'] = 5;
    myArray[3] = 'f';
    expected = [['0', 'a'], ['1', 'b'], ['2', 'c'], ['3', 'f'], ['-1', 'd'], ['e', 5]];
    expect(Object.entries(myArray)).toEqual(expected);
    expect(myArray.length).toBe(4); // only counts indexed values
  });
});