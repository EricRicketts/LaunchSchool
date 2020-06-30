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
    describe('first and last Methods', function () {
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

    describe('without Method', function () {
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

    describe('range Method', function () {

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

    describe('lastIndexOf Method', function () {

      it('is a function', function () {
        expect(typeof _().lastIndexOf).toBe('function');
      });

      it('returns last index of supplied value', function () {
        results = [_([1, 1, 1]).lastIndexOf(1), _([1, 2, 3]).lastIndexOf(2)];
        expected = [2, 1];
        expect(results).toEqual(expected);
      });
    });

    describe('sample Method', function () {

      it('is a function', function () {
        expect(typeof _().sample).toBe('function');
      });

      it('returns a single element when no argument is supplied', function () {
        results = _([1, 2, 3]).sample();
        expect(results === 1 || results === 2 || results === 3).toBe(true);
      });

      it('returns multiple non-repeated elements when a number is supplied', function () {
        results = _([1, 2, 1, 3]).sample(3);
        let check = (results[0] !== results[1]) && (results[0] !== results[2]) && (results[1] !== results[2]);
        expect(check && results.length === 3).toBe(true);
      });
    });
  });

  describe('Object and Object Collection Tests', function () {
    let dictionary, collection;
    describe('findWhere Method', function () {
      beforeEach(() => {
        dictionary = [{ foo: "bar", idx: 0 }, { foo: "baz", idx: 1 }, { foo: "bar", idx: 2 }];
      });

      it('is a function', function () {
        expect(typeof _().findWhere).toBe('function');
      });

      it('return object with only one matched property', function () {
        expect(_(dictionary).findWhere({ foo: 'bar' }).idx).toBe(0);
      });

      it('return undefined if no matched property', function () {
        expect(_(dictionary).findWhere({ foo: 'fizz' })).toBeUndefined();
      });

      it('returns object with more than one matched property', function () {
        dictionary = [
          { foo: "bar", quux: "q", idx: 0 }, { foo: "baz", quux: "z", idx: 1 },
          { foo: "bar", quux: "z", idx: 2 }
        ];
        expect(_(dictionary).findWhere({ foo: 'bar', quux: 'z'}).idx).toBe(2);
      });
    });

    describe('where Method', function () {
      beforeEach(() => {
        dictionary = [{ foo: "bar", idx: 0 }, { foo: "baz", idx: 1 }, { foo: "bar", idx: 2 }];
      });

      it('is a function', function () {
        expect(typeof _().where).toBe('function');
      });

      it('returns an array with one matched object', function () {
        expected = [{ foo: 'bar', idx: 0 }];
        expect(_(dictionary).where({ idx: 0 })).toEqual(expected);
      });

      it('returns an array with two matched objects', function () {
        expected = [{ foo: "bar", idx: 0 }, { foo: "bar", idx: 2 }];
        expect(_(dictionary).where({ foo: "bar" })).toEqual(expected);
      });

      it('returns an empty array if there is no match', function () {
        expect(_(dictionary).where({ foo: "fizz" })).toEqual([]);
      });
    });

    describe('pluck Method', function () {
      beforeEach(() => {
        collection = [{ foo: 'bar' }, { foo: 'baz' }];
      });

      it('is a function', function () {
        expect(typeof _().pluck).toBe('function');
      });

      it('returns an array of values', function () {
        expected = ['bar', 'baz'];
        expect(_(collection).pluck('foo')).toEqual(expected);
      });

      it('returns an empty array if there is no match', function () {
        expect(_(collection).pluck('acme')).toEqual([]);
      });
    });

    describe('keys and values Methods', function () {
      let object;
      beforeEach(() => {
        object = { foo: "bar", baz: "quuz" };
      });

      it('keys and values are function', function () {
        expected = ['function', 'function'];
        results = [typeof _().keys, typeof _().values];
        expect(results).toEqual(expected);
      });

      it('keys returns an array of keys from the object', function () {
        expected = ['foo', 'baz'];
        expect(_(object).keys()).toEqual(expected);
      });

      it('keys does not return inherited properties', function () {
        results = _(object).keys();
        expect(results).not.toContain('toString');
      });

      it('values returns an array of values from the object', function () {
        expected = ['bar', 'quuz'];
        expect(_(object).values()).toEqual(expected);
      });
    });

    describe('extend Method', function () {
      let newObj, oldObj, obj;
      beforeEach(() => {
        oldObj = { foo: 'bar' };
        newObj = { bar: 'baz' };
        obj = { foo: 'quuz' };
      });

      it('is a function', function () {
        expect(typeof _.extend).toBe('function');
      });

      it('returns an extended object using the new objects properties', function () {
        expected = { foo: 'bar', bar: 'baz' };
        results = _.extend(oldObj, newObj);
        expect(results).toEqual(expected);
      });

      it('modifies the first object passed in rather than creating a new object', function () {
        expect(_.extend(oldObj, {})).toBe(oldObj);
      });

      it('works with any number of objects', function () {
        expected = { foo: 'bar', bar: 'baz' };
        expect(_.extend(obj, oldObj, newObj)).toEqual(expected);
      });
    });
  });
});