describe('JS225 Object Oriented Javascript Function Contexts and Objects', function () {
  describe('Dealing With Context Loss First Case', function () {
    let john, firstFoo, secondFoo, firstCall, secondCall, thirdFoo, thirdCall;
    beforeEach(() => {
      john = {
        firstName: 'John',
        lastName: 'Doe',
        greetings: function() {
          return 'hello, ' + this.firstName + ' ' + this.lastName;
        }
      }
      firstCall = function(func) {
        return func.call(anotherJohn);
      }
      firstFoo = function() {
        let anotherJohn = {
          firstName: 'John',
          lastName: 'Doe',
          greetings: function() {
            return 'hello, ' + this.firstName + ' ' + this.lastName;
          }
        }
        return firstCall(anotherJohn.greetings);
      }
      secondCall = function(func, context) {
        return func.call(context);
      }
      secondFoo = function() {
        let anotherJohn = {
          firstName: 'John',
          lastName: 'Doe',
          greetings: function() {
            return 'hello, ' + this.firstName + ' ' + this.lastName;
          }
        }
        return secondCall(anotherJohn.greetings, anotherJohn);
      }
      thirdCall = function(func) {
        return func();
      }
      thirdFoo = function() {
        let anotherJohn = {
          firstName: 'John',
          lastName: 'Doe',
          greetings: function() {
            return 'hello, ' + this.firstName + ' ' + this.lastName;
          }
        }
        return thirdCall(anotherJohn.greetings.bind(anotherJohn));
      }
    });

    it('assigning a method to a variable removes the method execution context', function () {
      let foo = john.greetings;
      expect(() => { foo(); }).toThrow(TypeError);
      /*
      In the case above "this" is undefined as we are not in the browser environment and in strict mode.
      As undefined has no properties a TypeError will be thrown.  Note this happened because the method, greetings
      was decoupled from the object john.
       */
    });

    it('object john is out of scope when called by foo', function () {
      expect(() => { firstFoo(); }).toThrow(ReferenceError);
      /*
        In this case, we tried to call reference anotherJohn in order to provide the passed in function with a
        proper execution context.  However, anotherJohn is local to the firstFoo function so we I attempt to
        reference it in firstCall, I get a ReferenceError.  This happened because I experienced context loss
        when I passed in "anotherJohn.greetings" to the firstCall function, I am passing in the reference to a
        function so now the function operates by itself with no binding to its original object.  Thus the
        receiving function, firstCall must provide the execution context for the function I have passed in.
        I attempt to do this by referencing anotherJohn in the body of "firstCall" however, when "firstCall"
        is invoked, the object "anotherJohn" is out of scope, because the body of "firstCall" does not have
        access to it as the function definition for "firstCall" is outside of the body the function "firstFoo".
        This may seem confusing at first, but the closure of "firstCall" is lexically based, that is closure
        occurs based on the function definition of firstCall, not on its invocation.
       */
    });

    it('provide a parameter for explicit context restoration', function () {
      expect(secondFoo()).toBe('hello, John Doe');
      /*
      In this case in the object "secondFoo" an parameter was for the "greetings" method.  This method passed in
      the desired context, the local variable "anotherJohn" which is an object with the desired properties.  Now
      when "secondCall" is invoked, it has access to the necessary context to properly use "call"
       */
    });

    it('hard bind the function to an object', function () {
      expect(thirdFoo()).toBe('hello, John Doe');
      /*
      In this case when invoking the "thirdCall" function, the function which is returned, "anotherJohn.greetings" is
      hard bound to the "anotherJohn" object.  Remember, "bind" returns a function, unlike "call" and "apply" which
      actually invoke a function.  The key item in this piece of code is the anotherJohn.greetings.bind(anotherJohn)
      permanently binds the now standalone function anotherJohn.greetings to the object anotherJohn no matter where
      in the code this new function is invoked.
       */
    });
  });
});