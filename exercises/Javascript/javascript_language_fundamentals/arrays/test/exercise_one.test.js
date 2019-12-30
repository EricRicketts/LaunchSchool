describe('Javascript Language Fundamentals: Arrays: Exercise 1', () => {
  it('actions on an arry and its copy affect both arrays', () => {
    var expected;
    var myArray = [1, 2, 3, 4];
    var myOtherArray = myArray; // both arrays not point to the same location in memory
    expect(myArray).toEqual(myOtherArray);

    // an operation on any one of the two arrays will affect the other array
    // as they both point to the same location in memory
    myArray.pop();
    expected = [1, 2, 3];
    expect(myArray).toEqual(expected);
    expect(myOtherArray).toEqual(expected);

    // myArray has been reassigned a different array so it and myOtherArray
    // no longer point to the same location in memory
    myArray = [1, 2];
    expect(myArray).toEqual([1, 2]);
    expect(myOtherArray).toEqual(expected);
  });    
});