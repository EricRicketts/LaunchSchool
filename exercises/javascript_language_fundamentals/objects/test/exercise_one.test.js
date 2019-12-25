describe('Exercises; Javascript Language Fundamentals; Objects; Exercise One', () => {
  var MyObject, expected;

  beforeEach(() => {
    MyObject = {
      a: 'name',
      'b': 'test',
      123: 'c',
      1: 'd',
    };

  });
  it('All object property names coerced to strings', () => {
    expected = { a: 'name', 'b': 'test', '123': 'c', '1': 'd' };
    expect(MyObject).toEqual(expected);
  });

  it('Dot notation requires a proper identifier', () => {
    expect(MyObject.a).toBe('name');
  });

  it('Bracket notation coerces expressions to strings', () => {
    expect(MyObject[1]).toBe('d');
  });

  it('Bracket notation evaluates expressions if not a property name using a string', () => {
    expect(() => {
      MyObject[a];
    }).toThrow(ReferenceError);
    /*
    In bracket notation if the operand is not a valid string, numbers will be coerced
    to strings and variable values will be coerced to a string.  In this case Javascript
    looks for a variable 'a' and cannot find it.
    */
  });
});