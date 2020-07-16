import { myObject, myObjectArrow, myObjectNoArrow} from "../code/arrow_functions";

describe('Arrow Functions', function () {
  let elements, results, expected;
  beforeEach(() => {
    elements = [
      'Hydrogen',
      'Helium',
      'Lithium',
      'Beryllium'
    ];
    expected = [8, 6, 7, 9];
  });
  describe('Basic Syntax', function () {
    it('standard function syntax', function () {
      results = elements.map(function(element) {
        return element.length;
      });
      expect(results).toEqual(expected);
    });

    it('arrow function standard syntax block body requires return keyword', function () {
      results = elements.map((element) => {
        return element.length;
      });
      expect(results).toEqual(expected);
      results = elements.map((element) => {
        element.length;
      });
      expected = [undefined, undefined, undefined, undefined];
      expect(results).toEqual(expected);
    });

    it('one argument allows for removal of argument parentheses', function () {
      results = elements.map(element => {
        return element.length;
      });
      expect(results).toEqual(expected);
    });

    it('inline allows for implicit return statement', function () {
      results = elements.map(element => element.length)
      expect(results).toEqual(expected);
    });

    it('allows for deconstruction', function () {
      results = elements.map(({ length }) => length);
      expect(results).toEqual(expected);
    });

    it('cannot be used as constructors', function () {
      let Foo = (name) => { this.name = name; }
      expect(() => { new Foo('Bar'); }).toThrow(TypeError);
    });

    it('inline format to return object literals needs parentheses', function () {
      let foo = () => { foo: 1 };
      expect(foo()).toBeUndefined();
      foo = () => ({ foo: 1 });
      expect(foo()).toEqual({ foo: 1 });
    });
  });

  describe('Rules Regarding this', function () {
    let myArrowFunction, newObj;
    beforeEach(() => {
      newObj = {
        myArrowFunction: null,
        myMethod: function() {
          this.myArrowFunction = () => this;
        }
      }
      myObject.myMethod();
      myArrowFunction = myObject.myArrowFunction;
    });
    it('arrow functions lexically inherit a value for this', function () {
      results = [myObjectNoArrow.sum(), myObjectArrow.sum()];
      expected = [21, 21];
      expect(results).toEqual(expected);
    });

    it('Arrow functions retain lexical this', function () {
      expect(myObject.myArrowFunction()).toBe(myObject);
    });

    it('arrow functions retain lexical this even when unbound', function () {
      expect(myArrowFunction()).toBe(myObject);
    });

    it('call cannot be used to change arrow function execution context', function () {
      expect(myArrowFunction.call(newObj)).not.toBe(newObj);
      expect(myArrowFunction.call(newObj)).toBe(myObject);
    });

    it('apply cannot be used to change arrow function execution context', function () {
      expect(myArrowFunction.apply(newObj)).not.toBe(newObj);
      expect(myArrowFunction.apply(newObj)).toBe(myObject);
    });

    it('bind cannot be used to change arrow function execution context', function () {
      myArrowFunction.bind(newObj);
      expect(myArrowFunction()).not.toBe(newObj);
      expect(myArrowFunction()).toBe(myObject);
    });
  });
});