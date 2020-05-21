describe('Exercises JS225 Object Oriented Javascript Function Context, Scopes and Closures', function () {
  describe('Exercise Six', function () {
    let myFilter, array, filter, filterFunction, expected;
    beforeEach(() => {
      array = [2, 1, 3, 4, 5, 6, 9, 12];
      filter = { allowedValues: [5, 6, 9] };
      filterFunction = function(val) { return this.allowedValues.indexOf(val) >= 0; };
      myFilter = function(array, func, thisArg=undefined) {
        let result = [];
        array.forEach(function(val) {
          if (func.call(thisArg, val)) {
            result.push(val);
          }
        });
        return result;
      };
    });

    it('should return an empty array with no explicit value for "this"', function () {
      expect(() => { myFilter(array, filterFunction); }).toThrow(TypeError);
      /*
        the invocation throws a TypeError because I default thisArg to the global object for the myFilter function.
        Thus, when "filterFunction" is called it is calling allowedValues on thisArg which is globalThis.  The
        result of the call is undefined and undefined has no methods so a TypeError is thrown.
      */
    });

    it('should return the correct values if the appropriate value of "this" is included', function () {
      expected = [5, 6, 9];
      expect(myFilter(array, filterFunction, filter)).toEqual(expected);
    });

    it('should filter the array itself', function () {
      expected = [2, 4, 6, 12];
      let isEven = function(val) { return val % 2 === 0; }
      expect(myFilter(array, isEven)).toEqual(expected);
    });
  });
});