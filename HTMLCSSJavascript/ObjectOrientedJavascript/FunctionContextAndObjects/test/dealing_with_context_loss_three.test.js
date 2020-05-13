describe('JS225 Object Oriented Javascript Functions and Context and Objects', function () {
  describe('Dealing With Context Loss Three', function () {
    let firstObj, secondObj, thirdObj, fourthObj, expected;
    beforeEach(() => {
      expected = ['1 hello world', '2 hello world', '3 hello world'];
      firstObj = {
        a: 'hello',
        b: 'world',
        foo: function() {
          let ary = [];
          [1, 2, 3].forEach(function(n) {
            ary.push(String(n) + ' ' + this.a + ' ' + this.b);
          });
          return ary;
        }
      }
      secondObj = {
        a: 'hello',
        b: 'world',
        foo: function() {
          let ary = [];
          let that = this;
          [1, 2, 3].forEach(function(n) {
            ary.push(String(n) + ' ' + that.a + ' ' + that.b);
          });
          return ary;
        }
      }
      thirdObj = {
        a: 'hello',
        b: 'world',
        foo: function() {
          let ary = [];
          [1, 2, 3].forEach(function(n) {
            ary.push(String(n) + ' ' + this.a + ' ' + this.b);
          }.bind(this));
          return ary;
        }
      }
      fourthObj = {
        a: 'hello',
        b: 'world',
        foo: function() {
          let ary = [];
          [1, 2, 3].forEach(function(n) {
            ary.push(String(n) + ' ' + this.a + ' ' + this.b);
          }, this);
          return ary;
        }
      }
    });

    it('function as argument still experiences context loss', function () {
      expect(() => { firstObj.foo(); }).toThrow(TypeError);
      /*
      forEach takes a function as an argument but even when the function is passed as an argument
      within the scope of foo and foo has access to "this", the anonymous function still has the global
      object as its execution context.
       */
    });

    it('using a prior technique to initialize a local variable to the execution context', function () {
      expect(secondObj.foo()).toEqual(expected);
      /*
      Using a technique from the last lesson, a local variable was declared which holds the value of the
      implicit execution context.  Now the anonymous function can reference the execution context due to the
      normal rules of lexical scoping.
       */
    });

    it('explicitly bind the anonymous function to the execution context', function () {
      expect(thirdObj.foo()).toEqual(expected);
      /*
      The solution for thirdObj is taken from one of the prior assignments, one just binds the anonymous function
      to the "this" since bind returns a function bound to a given object, forEach now executes the anonymous
      function in proper context.
       */
    });

    it('forEach allows for explicit binding', function () {
      expect(fourthObj.foo()).toEqual(expected);
    });
  });
});