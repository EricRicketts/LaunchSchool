describe('JS225 Object Oriented Javascript', function () {
  describe('Object Creation Patterns', function () {
    describe('Problems: Prototypical Inheritance and Behavior Delegation', function () {
      let foo, bar, results, expected;
      beforeEach(() => {
        foo = {};
        bar = Object.create(foo);
      });

      it('properties added to the prototype are available to a descendent object', function () {
        foo.a = 1;
        expected = [1, []];
        results = [bar.a, Object.getOwnPropertyNames(bar)];
        expect(results).toEqual(expected);
      });

      it('"own" properties take precedence over prototype properties', function () {
        foo.a = 1;
        bar.a = 2;
        let aBar = bar.a
        delete bar.a;
        results = [aBar, bar.a];
        expected = [2, 1];
        expect(results).toEqual(expected);
      });

      it('Object.getOwnPropertyNames checks for properties not in the prototype chain', function () {
        let boo = {};
        boo.myProp = 1;
        let far = Object.create(boo);
        results = [far.hasOwnProperty("myProp"), boo.hasOwnProperty("myProp")];
        expected = [false, true];
        expect(results).toEqual(expected);
        /*
          If there is a lot of intervening code between the creation of boo and far we do not know if far could
          have added its own myProp.  However, we can always check using the hasOwnProperty method.
        */
      });
    });
  });
});