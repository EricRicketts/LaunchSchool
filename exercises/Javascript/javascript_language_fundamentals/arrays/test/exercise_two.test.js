describe('Javascript Language Fundamentals: Arrays: Exercise 2', () => {
  it('copy only the values of the array, not the reference to the array itself', () => {
    var expected = [1, 2, 3, 4];
    var myArray = [1, 2, 3, 4];
    // with this assignment, myOtherArray points to a different location in memory
    var myOtherArray = []; 
    myArray.forEach(element => {
      myOtherArray.push(element);
    });

    // thought the values are the same for each array they are different arrays
    expect(myArray).toEqual(expected);
    expect(myOtherArray).toEqual(expected);
  
    // since they are different arrays an operation on one does not affect the other
    myArray.pop();
    expect(myArray).toEqual([1, 2, 3]);
    expect(myOtherArray).toEqual(expected);

    myArray = [1, 2];
    expect(myArray).toEqual([1, 2]);
    expect(myOtherArray).toEqual(expected);
  });

  it('Another way to copy only the values of the array', () => {
    var myArray = [1, 2, 3, 4];
    var myOtherArray = myArray.slice();  // slice returns a new array object
    var expected = [1, 2, 3, 4];

    expect(myArray).toEqual(expected);
    expect(myOtherArray).toEqual(expected);

    // since they are different arrays an operation on one does not affect the other
    myArray.pop();
    expect(myArray).toEqual([1, 2, 3]);
    expect(myOtherArray).toEqual(expected);
  
    myArray = [1, 2];
    expect(myArray).toEqual([1, 2]);
    expect(myOtherArray).toEqual(expected);    
  });
});