describe('Exercises: Javascript Language Fundamentals; Objects; Exercise Three', () => {
  var array1, array2, array3, array4, expected, i;

  beforeEach(() => {
    expected = ['Moe', 'Larry', 'Curly', 'Chemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'];
    array1 = ['Moe', 'Larry', 'Curly', 'Chemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'];
    array2 = [];
    array3 = [new String('foo'), new String('bar'), new String('fizz'), new String('buzz')];
    array4 = [];
    for (i = 0; i < array1.length; i += 1) {
      array2.push(array1[i]);
    }

    for (i = 0; i < array3.length; i += 1) {
      array4.push(array3[i]);
    }
  });

  it('changing one object does not affect another with the same values', () => {
    var array1Expected = ['Moe', 'Larry', 'CURLY', 'CHEMP', 'Harpo', 'CHICO', 'Groucho', 'Zeppo'];
    for (i = 0; i < array1.length; i += 1) {
      if (array1[i].startsWith('C')) {
        array1[i] = array1[i].toUpperCase();
      }
    }
    expect(array1).toEqual(array1Expected);
    expect(array2).toEqual(expected);
    /*
    array1 and array2 are not the same array even though they were initialized with the same values.
    changes to array1 are not reflected in array2 because the values in array2 are primitives and
    they are immutable.  In array1 new primitives were reassigned to the slots in the array, the
    values themselves were not changed.
    */
  });

  it('each array will show the same changes if the same object is appended to each array and changed', () => {
      var obj = { a: 'foo' };
      expected = { a: 'bar' };
      array1.push(obj);
      array2.push(obj);
      var lastIndex = array1.length - 1;
      array1[lastIndex].a = 'bar';
      expect(array1[lastIndex]).toEqual(expected);
      expect(array1[lastIndex]).toEqual(array2[lastIndex]);
  });

  it('one way to ensure changes in array3 are reflected in array4 is to make them the same object', () => {
    array4 = array3;
    expected = ['FOO', 'bar', 'FIZZ', 'buzz'];
    for (i = 0; i < array3.length; i += 1) {
      if (array3[i].startsWith('f')) {
        array3[i] = new String(array3[i].toUpperCase());
      }
    }
    for (i = 0; i < array3.length; i += 1) {
      expect(array3[i].valueOf()).toBe(expected[i]);
      expect(array4[i].valueOf()).toBe(expected[i]);
    }
  });
});