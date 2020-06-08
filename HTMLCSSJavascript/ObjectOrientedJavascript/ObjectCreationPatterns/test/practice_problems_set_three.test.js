import { Circle, Foo, Ninja, RECTANGLE,
  Rectangle, RectangleFixed } from "../code/constructor_functions_and_prototypes_version_one";

describe('JS225 Object Oriented Javascript', function () {
  describe('Object Creation Patterns', function () {
    describe('Practice Problems Set Three', function () {
      describe('Constructor Functions and Object Prototypes', function () {
        let expected, results;
        describe('Problem One; Foo', function () {
          let a, foo, obj;
          beforeEach(() => {
            a = 1;
            obj = {};
            foo = new Foo();
          });

          it('should execute all of the code in the function and return an object', function () {
            foo.bar();
            results = [foo.arr, foo instanceof Foo, typeof foo];
            expected = [[2, 2], true, 'object'];
            expect(results).toEqual(expected);
          });

          it('calling Foo without constructor is a normal function call', function () {
            expect(() => { Foo(); }).toThrow(TypeError);
          });

          it('passing in object during a normal function call should mutate the object', function () {
            Foo.call(obj);
            obj.bar();
            results = [obj.a, obj.arr];
            expected = [2, [2, 2]];
            expect(results).toEqual(expected);
          });

          it('should not affect the global value of a', function () {
            expect(this.a).toBeUndefined();
          });
        });
        describe('Problem Two: Rectangle', function () {
          let rect1, rect2;
          beforeEach(() => {
            rect1 = new Rectangle(2, 3);
            rect2 = new RectangleFixed(2, 3);
          });
          it('original functions for area and perimeter have incorrect function bindings', function () {
            expect(rect1.area).toBeNaN();
            expect(rect1.perimeter).toBeNaN();
            /*
              I originally thought it would be a TypeError but because RECTANGLE is an object, "this" is not undefined
              but the RECTANGLE object, however, RECTANGLE has not width or height so we end up calling properties on
              RECTANGLE that do not exist, so the return value is undefined.  It we try to add two undefined values
              we get NaN.
            */
          });

          it('can be fixed simply by using call on the RECTANGLE methods', function () {
            results = [rect2.area, rect2.perimeter];
            expected = [6, 10];
            expect(results).toEqual(expected);
          });
        });
        describe('Problem 3: Circle', function () {
          let a, b;
          beforeEach(() => {
            a = new Circle(3);
            b = new Circle(4);
          });
          it('should return the area of the circles', function () {
            results = [a.area().toFixed(2), b.area().toFixed(2)];
            expected = ['28.27', '50.27'];
            expect(results).toEqual(expected);
          });
        });
        describe('Problems 4 through 7: Ninjas', function () {
          let ninja, ninjaA, ninjaB;
          beforeEach(() => {
            ninja = new Ninja();
          });
          describe('Problem 4: First Ninja', function () {
            beforeEach(() => {
              Ninja.prototype.swingSword = function() {
                return this.swung;
              }
            });
            it('should return true for a swung sword', function () {
              expect(ninja.swingSword()).toBe(true);
              /*
                Note this happens even after the property is created.  It works because the prototype was modified
                and the prototype object as an object is always referenced.  This means any change to the prototype
                property is made available to all objects currently in existence, as the [[Prototype]] property is
                always referenced by any object instantiated by a constructor function.
              */
            });
          });
          describe('Problem 5: Second Ninja', function () {
            beforeEach(() => {
              Ninja.prototype = {
                swingSword: function() {
                  return this.swung;
                }
              }
            });
            it('should return NaN for a swung sword', function () {
              expect(() => { ninja.swingSword(); }).toThrow(TypeError);
              let ninja2 = new Ninja();
              expect(ninja2.swingSword()).toBe(true);
              /*
                We get a TypeError the error message reads swingSword is not a function.  We can see what happened
                here when we run both assertions.  When the constructor was first called and the ninja object was
                created the [[Prototype]] property for the object ninja pointed to the original prototype given to it
                by the original constructor function.  However, we later redefine the prototype for the constructor
                function in the beforeEach for problem 5.  So the prototype for the constructor is not modified with
                a new property but is given an entirely new object.  Thus the original object ninja still points to
                the old [[Prototype]] while ninja2 points to the new [[Prototype]].
              */
            });
          });
          describe('Problem 6: Third Ninja', function () {
            beforeEach(() => {
              function Ninja() {
                this.swung = false;
              }
              Ninja.prototype.swing = function() {
                this.swung = !this.swung;
                return this;
              }
              ninjaA = new Ninja();
              ninjaB = new Ninja();
            });
            it('should have a swing method which toggles the swung property', function () {
              results = [ninjaA.swing().swung, ninjaB.swing().swung];
              expected = [true, true];
              expect(results).toEqual(expected);
              // Launch School solution set this.swing = true in the swing function I toggled it, so even though the
              // implementation was different the results were the same.
            });
          });
          describe('Problem 7: Fourth Ninja', function () {
            beforeEach(() => {
              ninjaA = (function() {
                function Ninja() {}
                return new Ninja();
              })();
              ninjaB = Object.create(Object.getPrototypeOf(ninjaA));
            });
            it('should create the same constructors', function () {
              expect(ninjaA.constructor === ninjaB.constructor).toBe(true);
            });
            it('Launch School second solution', function () {
              let ninjaC = new ninjaA.constructor;
              expect(ninjaC.constructor === ninjaA.constructor).toBe(true);
              /*
                Note there is an important point to be made in this solution.  First of all my solution was the first
                option that Launch School presented.  In this second solution we call for the constructor of ninjaA,
                but remember the constructor points back to the original function, so in this case it would point
                back to function Ninja() {}.  Then we use the 'new' keyword to call this constructor and return an
                object which is referenced by the variable ninjaC.  Note any properties included in the body of this
                constructor would also be included in ninjaC.  Where as in the first solution, a new object is
                returned with the [[Prototype]] pointing to Ninja.prototype.
              */
            });
          });
        });
      });
    }); 
  });
});

/*
I wanted to make some notes about what would be the results if I used the exact code from the exercise and we were
in the browser environment:

var a = 1;
var foo;
var obj;

function Foo() {
  this.a = 2;
  this.bar = function() {
    console.log(this.a);
  };
  this.bar();
}

foo = new Foo();

foo.bar();
Foo();

obj = {};
Foo.call(obj);
obj.bar();

console.log(this.a);

with the line foo = new Foo()

2 => foo = new Foo(); calls console.log(this.a);
2 => foo.bar(); calls console.log(this.a);
2 => Foo(); calls console.log(this.a);
2 => Foo.call(obj); calls console.log(this.a);
2 => obj.bar(); calls console.log(this.a);
2 => console.log(this.a); calls this at the global level which is set to 2 when Foo() is invoked as a standalone
function meaning this is the global object.
*/