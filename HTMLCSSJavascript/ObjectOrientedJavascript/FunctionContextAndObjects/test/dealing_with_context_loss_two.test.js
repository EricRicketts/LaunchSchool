describe('JS225 Object Oriented Javascript: Function Context and Objects', function () {
  describe('Dealing With Context Loss Two', function () {
    let firstObj, secondObj, thirdObj, fourthObj;
    beforeEach(() => {
      firstObj = {
        a: 'hello',
        b: 'world',
        foo: function() {
          function bar() {
            return this.a + ' ' + this.b;
          }
          return bar();
        }
      }
      secondObj = {
        a: 'hello',
        b: 'world',
        foo: function() {
          let that = this;
          function bar() {
            return that.a + ' ' + that.b;
          }
          return bar();
        }
      }
      thirdObj = {
        a: 'hello',
        b: 'world',
        foo: function() {
          function bar() {
            return this.a + ' ' + this.b;
          }
          return bar.call(this);
        }
      }
      fourthObj = {
        a: 'hello',
        b: 'world',
        foo: function() {
          let bar = function () {
            return this.a + ' ' + this.b;
          }.bind(this);
          return bar();
        }
      }
    });

    it('internal function bar is in global execution context when invoked within function foo', function () {
      expect(() => { firstObj.foo(); }).toThrow(TypeError);
      /*
      This is an interesting case, and Launch School points it out because it occurs quite often.  One assumes when
      bar is called within the lexical scope of foo that the execution context would be firstObj as this is the
      implicit execution context for foo, or put another way if we were to console.log(this) right after the
      opening statement for the declaration of foo we would get the firstObj as being logged to the console.  My guess
      is bar is being invoked in functional context not method context, this mean it needs to be explicitly bound
      to an object.
       */
    });

    it('explicitly bind a method invocation to an execution context with a variable', function () {
      expect(secondObj.foo()).toBe('hello world');
      /*
      In the above case, within the lexical scope of foo, foo can reference its execution context which is
      captured in this.  We set "this" to a local variable, "that" now "that" is within the lexical scope of
      the function bar so it can be used in place of "this" to refer to the owning object.
       */
    });

    it('explicitly bind a method invocation to an execution context with call', function () {
      expect(thirdObj.foo()).toBe('hello world');
      /*
      In the above case, bar was called with an explicit invocation.  Contrary to its use in firstObj,
      the developer provided an execution context for invocation.
       */
    });

    it('explicitly bind a method invocation to an execution context with bind', function () {
      expect(fourthObj.foo()).toBe('hello world');
      /*
      This is the final way and more permanent way, a function expression is used so that bar can be bound
      to the fourthObj as its execution context.  Now within foo, bar can be invoked with full assurance that
      it will be bound to fourthObj.
       */
    });
  });
});