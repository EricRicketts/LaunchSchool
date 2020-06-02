describe('JS225 Object Oriented Javascript', function () {
  describe('Object Creation Patterns', function () {
    describe('Practice Problems: Objects and Prototypes', function () {
      let prot, foo;
      it('Object.create takes a prototype and returns an object', function () {
        prot = {};
        foo = Object.create(prot);
        expect(Object.getPrototypeOf(foo)).toEqual(prot);
      });

      it('one can use isPrototypeOf to test for prototype chain', function () {
        prot = {};
        foo = Object.create(prot);
        expect(prot.isPrototypeOf(foo)).toBe(true);
      });

      it('understanding prototype chain', function () {
        prot = {};
        foo = Object.create(prot);
        expect(prot.isPrototypeOf(foo)).toBe(true);
        expect(Object.prototype.isPrototypeOf(foo)).toBe(true);
      });
    });

    describe('Further investigations into Object.create', function () {
      let obj, proto, foo, expected;
      beforeEach(() => {
        proto = { a: 1, b: 2, add: function() { return this.a + this.b; } };
        obj = Object.create(proto);
      });

      it('should takes an object as the prototype of the new object to be created', function () {
        expect(typeof obj).toBe('object');
      });

      it('Properties of prototype are not own properties of new object', function () {
        expect(Object.getOwnPropertyNames(obj)).toEqual([]);
      });

      it('Prototype properties can be extracted from object', function () {
        let protoObj = Object.getPrototypeOf(obj);
        expect(protoObj === proto).toBe(true);
      });

      it('can add own properties during object creation', function () {
        foo = Object.create(proto, {
          d: {
            configurable: true,
            writable: true,
            enumerable: true,
            value: 3
          },
          e: {
            configurable: true,
            writable: true,
            enumerable: true,
            value: function() {
              return this.a + this.b + this.add() + this.d;
            }
          }
        });
        expect(Object.getOwnPropertyNames(foo)).toEqual(["d", "e"]);
        expect(foo.e()).toBe(9);
      });
    });
  });
});