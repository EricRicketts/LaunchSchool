import { _ } from '../code/utilities_v2';

describe('Practice Project: Array and Object Utility Library', function () {
  let results, expected;
  it('top level function "_" is defined', function () {
    expect(typeof _).toBe('function');
  });
  describe('Array Tests', function () {
    let emptyArray;
    beforeEach(() => {
      emptyArray = [];
    });
    describe('First and Last Methods', function () {
      let fourElementArray, oneElementArray;
      beforeEach(() => {
        oneElementArray = [4];
        fourElementArray = [1, 2, 3, 4];
      });

      it('first is a function', function () {
        expect(typeof _().first).toBe('function');
      });

      it('first should return the only element in a one element array', function () {
        expect(_(oneElementArray).first()).toBe(4);
      });

      it('first returns "undefined" even if first element is undefined', function () {
        emptyArray[1] = 4;
        expect(_(emptyArray).first()).toBeUndefined();
      });

      it('last is a function', function () {
        expect(typeof _().last).toBe('function');
      });

      it('last returns the last element in an array', function () {
        expect(_(fourElementArray).last()).toBe(4);
      });

      it('last returns "undefined" if the last element is undefined', function () {
        fourElementArray.push(undefined);
        expect(_(fourElementArray).last()).toBeUndefined();
      });
    });

    describe('Without Method', function () {
      let fiveElementArray, sixElementArray; 
      beforeEach(() => {
        fiveElementArray = [1, 2, 3, 4, 5];
        sixElementArray = [1, 2, 3, 4, 5, 6];
      });

      it('without is a function', function () {
        expect(typeof _().without).toBe('function');
      });

      it('without returns a new array without the supplied argument', function () {
        expected = [1, 2, 3, 5];
        expect(_(fiveElementArray).without(4)).toEqual(expected);
      });

      it('without removes any number of arguments', function () {
        expected = [1, 3, 4, 5];
        expect(_(sixElementArray).without(2, 6, 8)).toEqual(expected);
      });
    });

    describe('Range Method', function () {

      it('should be a function', function () {
        expect(typeof _.range).toBe('function');
      });

      it('returns an array of values starting at 0 when one argument given', function () {
        expected = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
        expect(_.range(10)).toEqual(expected);
      });

      it('returns an array of values starting with the first value when two arguments given', function () {
        expected = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        expect(_.range(1, 10)).toEqual(expected);
      });
    });
  });
});