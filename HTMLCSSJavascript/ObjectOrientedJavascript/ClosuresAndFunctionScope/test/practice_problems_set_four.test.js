import {
  subtract, sub5, makePartialFunc, makeSubN,
  multiply, subjects, makeMathRollCall
} from "../code/partial_function_application";

describe('JS225 Object Oriented Javascript Closures and Function Scope', function () {
  describe('Practice Problems Set Four Partial Function Application', function () {
    let actual, expected, sub1, sub10, multiplyBy5, mathRollCall;
    beforeEach(() => {
      sub1 = makeSubN(1);
      sub10 = makeSubN(10);
      multiplyBy5 = makePartialFunc(multiply, 5);
      mathRollCall = makeMathRollCall();
    });
    it('should subtract two numbers', function () {
      expect(subtract(10, 3)).toBe(7);
    });

    it('should subtract 5 from a number', function () {
      actual = [sub5(10), sub5(20)];
      expected = [5, 15];
      expect(actual).toEqual(expected);
    });

    it('should subtract 1 and 10 from a number', function () {
      actual = [sub1(10), sub10(5)];
      expected = [9, -5];
      expect(actual).toEqual(expected);
    });

    it('should multiply a number by 5', function () {
      expect(multiplyBy5(100)).toBe(500);
      /*
        Note in our definition for multiplyBy5 we end up invoking the function multiply with one argument
        set to 5.  This is possible even though multiplyBy5 has been invoked well after the execution of
        makePartialFunc because multiplyBy5 retains a closure over the multiply function and the b parameter.
        multiplyBy5 retains
      */
    });

    it('returns students enrolled in math', function () {
      expected = 'Math:\nFatima\nGary\nSusan';
      expect(mathRollCall(subjects['Math'])).toBe(expected);
    });
  });
});