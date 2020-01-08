describe('Exercises Javascript Language Fundamentals Medium Two Exercise Five', function () {
  var array;

  it('Array indices must be only non negative integers', function () {
    array = ['Apples', 'Peaches', 'Grapes'];

    array[3.4] = 'Oranges';
    expect(array.length).toBe(3);
    expect(Object.keys(array).length).toBe(4);

    array[-2] = 'Watermelon';
    expect(array.length).toBe(3);
    expect(Object.keys(array).length).toBe(5);
  });
});
/*
this test illustrates that Arrays are special objects in Javascript, note that they
are still objects.  One of the differences is that Array indices must be a nonnegative
integer from 0 to 2^32 - 1, any other 'index' is going to be stored in the array
as an ordinary object key/value pair.
 */