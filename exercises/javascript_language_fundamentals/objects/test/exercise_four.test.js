describe('Exercises: Javascript Language Fundamentals: Objects: Exercise 4', () => {
  var myObject, expected;

  beforeEach(() => {
    myObject = {
      prop1: '123',
      prop2: '234',
      'prop 3': '345',
    };
  });

  it('dot notation must have valid identifier, bracket notation can use any valid string', () => {
    expected = { prop1: '123', prop2: '456', 'prop 3': '345', '456': '678' };
    var prop2 = '456';
    myObject['prop2'] = '456';
    myObject[prop2] = '678';
    expect(myObject).toEqual(expected);
  });

  it('another example of dot and bracket notation', () => {
    var myObj = {};
    expected = { 'funcProp': 'hello, ' };
    myObj[myFunc()] = 'hello, ';

    function myFunc() {
      return 'funcProp';
    }

    expect(myObj).toEqual(expected);

    myObj[myFunc()] = 'world!';
    expect(myObj).toEqual({ 'funcProp': 'world!' });
  });
});