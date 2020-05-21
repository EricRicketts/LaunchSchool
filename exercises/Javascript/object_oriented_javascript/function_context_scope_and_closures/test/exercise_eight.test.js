import { stack } from "../code/stack";

describe('Exercises JS225 Object Oriented Javascript Function Context, Scopes, and Closures', function () {
  describe('Exercise Eight', function () {
     let myStack, actual, expected;
     beforeEach(() => {
       actual = [];
       myStack = stack;
     });
     afterAll(() => {
       myStack.clear();
     });

    it('should push a value onto a stack', function () {
       expected = [1, 2, 3, '0\n1\n2'];
       [0, 1, 2].forEach((val) => actual.push(myStack.push(val)) );
       actual.push(myStack.printStack());
       expect(actual).toEqual(expected);
    });

    it('should pop a value from the stack', function () {
      expected = [3, '1\n2'];
      [1, 2, 3].forEach((val) => myStack.push(val) );
      actual.push(myStack.pop());
      actual.push(myStack.printStack());
      expect(actual).toEqual(expected);
    });
  });
});