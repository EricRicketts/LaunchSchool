describe('JS225 Object Oriented Javascript', function () {
  describe('Exercises: Object Creation Patterns', function () {
    let foo, bar, baz, qux, expected;
    beforeEach(() => {
      foo = { name: 'foo' };
      bar = Object.create(foo);
      bar.name = 'bar';
      baz = Object.create(bar);
      baz.name = 'baz';
      qux = Object.create(baz);
      qux.name = 'qux';
    });
    describe('Exercise One: My Solution', function () {
      beforeEach(() => {
        Object.prototype.ancestors = function() {
          let ancestors = [];
          let ancestor = Object.getPrototypeOf(this);
          while (ancestor !== null) {
            if (ancestor === Object.prototype) {
              ancestors.push('Object.prototype');
            } else {
              ancestors.push(ancestor.name);
            }
            ancestor = Object.getPrototypeOf(ancestor);
          }

          return ancestors;
        }
      });

      it('ancestor of foo should be Object.prototype', function () {
        expected = ['Object.prototype'];
        expect(foo.ancestors()).toEqual(expected);
      });

      it('ancestors of bar should be foo and Object.prototype', function () {
        expected = ['foo', 'Object.prototype'];
        expect(bar.ancestors()).toEqual(expected);
      });

      it('ancestors of baz should be bar, foo, and Object.prototype', function () {
        expected = ['bar', 'foo', 'Object.prototype'];
        expect(baz.ancestors()).toEqual(expected);
      });

      it('ancestors of qux should be baz, bar, foo, and Object.prototype', function () {
        expected = ['baz', 'bar', 'foo', 'Object.prototype'];
        expect(qux.ancestors()).toEqual(expected);
      });
    });
    describe('Exercise One: Launch School Solution', function () {
      beforeEach(() => {
        Object.prototype.ancestors = function() {
          let ancestor = Object.getPrototypeOf(this);
          if (Object.prototype.hasOwnProperty.call(ancestor, 'name')) {
            return [ancestor.name].concat(ancestor.ancestors());
          }
          return ['Object.prototype'];
        }
      });

      it('LS ancestor of foo should be Object.prototype', function () {
        expected = ['Object.prototype'];
        expect(foo.ancestors()).toEqual(expected);
      });

      it('LS ancestors of bar should be foo and Object.prototype', function () {
        expected = ['foo', 'Object.prototype'];
        expect(bar.ancestors()).toEqual(expected);
      });

      it('LS ancestors of baz should be bar, foo, and Object.prototype', function () {
        expected = ['bar', 'foo', 'Object.prototype'];
        expect(baz.ancestors()).toEqual(expected);
      });

      it('LS ancestors of qux should be baz, bar, foo, and Object.prototype', function () {
        expected = ['baz', 'bar', 'foo', 'Object.prototype'];
        expect(qux.ancestors()).toEqual(expected);
      });
      /*
        I knew it would be possible to do a recursive solution but I was not sure of how to go about it.  The LS
        solution is very clear.  First get the prototype of the current object, then if "name" is an own property
        return an array containing the name of the object concatenated with another call to ancestors.  When you get
        to the top of the prototype chain, return 'Object.prototype'.
      */
    });
  }); 
});