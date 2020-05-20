describe('Exercises JS225 Object Oriented Javascript Function Contexts, Scopes, and Closures', function () {
  describe('Exercise Five', function () {
    let myBind, addNumbers;
    beforeEach(() => {
      myBind = function(func, context, ...args1) {
        return function(...args2) {
          let args = args1.concat(args2);
          return func.apply(context, args);
        }
      }
      addNumbers = function(a, b) {
        return a + b;
      }
    });

    it('should allow for partial function application', function () {
      let addFive = myBind(addNumbers, null, 5);
      expect(addFive(10)).toBe(15);
    });
  });
});