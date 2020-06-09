import { delegate } from "../code/delegate";

describe('JS225 Object Oriented Javascript', function () {
  describe('Exercises: Object Creation Patterns', function () {
    describe('Exercise Two', function () {
      let foo, bar, baz;
      beforeEach(() => {
        foo = {
          name: 'test',
          bar: function(greeting) {
            return `${greeting} ${this.name}`;
          }
        }
        bar = {
          buzz: function(first, last) {
            return `${first} ${last}`;
          },
          fizz: delegate(bar, "buzz", 'Foo', 'Bar')
        }
        baz = {
          qux: delegate(foo, 'bar', 'hello')
        }
        /*
          I encountered an error originally.  For the fizz property I originally had the last arguments in place of
          'Foo' and 'Bar' being first and last.  The reason for this mistake is simple, the property value for fizz is
          an invocation of delegate, not a function definition which has been declared elsewhere.  Additionally, I had
          invoked delegate with "this" as the first argument.  However, "this" only takes on the value of the current
          object if it is defined in a function body.  So when I called the function it was taking on the value of
          "this" provided by the Jest test tool.
        */
      });
      it('delegates the foo method to baz', function () {
        expect(baz.qux()).toBe('hello test');
      });

      it('as the target object method changes delegate should reflect this', function () {
        foo.bar = function() { return 'method changed'; };
        expect(baz.qux()).toBe('method changed');
      });

      it('delegate should handle an argument list', function () {
        expect(bar.fizz()).toBe('Foo Bar');
      });
    });
  });
});