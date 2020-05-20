describe('Exercises JS225 Object Oriented Javascript Function Context, Scopes, and Closures', function () {
  describe('Exercise Four', function () {
    let myBind;
    beforeEach(() => {
      myBind = function(func, context) {
        return function(...args) {
          return func.apply(context, args);
        }
      }
    });

    it('should bind to an object, the function has an argument', function () {
      let obj = { a: 5 };
      let otherObj = { a: 10 };
      let addA = function(n) {
        return this.a + n;
      }
      let bound = myBind(addA, obj);
      expect(bound(6)).toBe(11);
      expect(bound.call(otherObj, 6)).toBe(11);
    });
  });
});