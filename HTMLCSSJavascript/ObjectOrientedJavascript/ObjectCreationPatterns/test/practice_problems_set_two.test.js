import { extend, getDefiningObject, shallowCopy } from "../code/prototypes_and_prototypical_inheritance";

describe('JS225 Object Oriented Javascript', function () {
  describe('Object Creation Patterns', function () {
    describe('Practice Problems Set Two', function () {
      describe('Prototypes and Prototypical Inheritance', function () {
        let foo, bar, baz, qux, joe, funcs, results, expected;
        beforeEach(() => {
          foo = { a: 1, b: 2 };
          bar = Object.create(foo);
          joe = { name: 'Joe' };
          funcs = {
            sayHello: function() {
              return 'Hello, ' + this.name;
            },
            sayGoodBye: function() {
              return 'Goodbye, ' + this.name;
            }
          }
        });

        it('return the origin of a property using the prototype chain', function () {
          baz = Object.create(bar);
          qux = Object.create(baz);
          bar.c = 3;
          results = [getDefiningObject(qux, 'c'), getDefiningObject(qux, 'e')];
          expected = [bar, null];
          expect(results).toEqual(expected);
        });

        it('should create a shallow copy of the provided object', function () {
          bar.c = 3;
          bar.say = function () {
            return 'c is ' + this.c;
          }
          baz = shallowCopy(bar);
          results = [
            baz.a, baz.say(), baz.hasOwnProperty('a'), baz.hasOwnProperty('b')
          ];
          expected = [1, 'c is 3', false, false];
          expect(results).toEqual(expected);
        });

        it('should extend an object by adding on the properties of other objects', function () {
          foo = { a: 0, b: { x: 1, y: 2 } };
          let object = extend({}, foo, joe, funcs);
          results = [object.b.x, object.sayHello()];
          expected = [1, 'Hello, Joe'];
          expect(results).toEqual(expected);
        });
      }); 
    }); 
  }); 
});