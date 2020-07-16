import { createObject, Rectangle } from "../code/classes";

describe('ES6 Classes', function () {
  let Foo, rect1, rect2;
  beforeEach(() => {
    rect1 = new Rectangle(10, 5);
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
    expect(rect1.getArea()).toBe(50);
  });

  it('classes require the new keyword', function () {
    expect(() => { Rectangle(5, 5); }).toThrow(TypeError);
  });

  it('typeof behaves same as constructor', function () {
    expect(typeof Rectangle).toBe('function');
  });

  it('instanceof behaves same as constructor', function () {
    expect(rect1 instanceof Rectangle).toBe(true);
  });

  it('constructor property remains on all instances', function () {
    expect(rect1.constructor).toBe(Rectangle);
  });

  it('classes are first class citizens', function () {
    let foo = createObject(Foo, 'FooBar');
    expect(foo.sayHi()).toBe('FooBar');
  });
});