import { createObject, Rectangle, Square } from "../code/classes";

describe('ES6 Classes', function () {
  let Foo, rectangle, square, results, expected;
  beforeEach(() => {
    rectangle = new Rectangle(10, 5);
    square = new Square(10);
    Foo = class {
      constructor(foo) {
        this.foo = foo;
      }
      sayHi() {
        return this.foo;
      }
    }
  });

  it('classes operate like any other constructor function', function () {
    results = [rectangle.getArea(), rectangle.toString()];
    expected = [50, '[Rectangle 50]'];
    expect(results).toEqual(expected);
  });

  it('classes allow for static properties and methods', function () {
    expect(Rectangle.getDescription()).toBe('Foo');
    expect(Rectangle.description).toBe('A rectangle is a 4 sided figure with 2 pairs of equal sides.');
  });

  it('classes require the new keyword', function () {
    expect(() => { Rectangle(5, 5); }).toThrow(TypeError);
  });

  it('typeof behaves same as constructor', function () {
    expect(typeof Rectangle).toBe('function');
  });

  it('instanceof behaves same as constructor', function () {
    expect(rectangle instanceof Rectangle).toBe(true);
  });

  it('constructor property remains on all instances', function () {
    expect(rectangle.constructor).toBe(Rectangle);
  });

  it('classes are first class citizens', function () {
    let foo = createObject(Foo, 'FooBar');
    expect(foo.sayHi()).toBe('FooBar');
  });

  it('classes allow inheritance', function () {
    results = [square.getArea(), square.toString(), square.length, square.width];
    expected = [100, '[Square 100]', 10, 10];
    expect(results).toEqual(expected);
  });
});