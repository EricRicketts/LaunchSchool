describe('JS225 Object Oriented Javascript', function () {
  describe('More Methods On The Object Constructor', function () {
    let results, expected;
    describe('Mimic Classical Inheritance', function () {
      let Rectangle, Square, rectangle, square;
      beforeEach(() => {
        Rectangle = function(width, height) {
          this.width = width;
          this.height = height;
        }
        Rectangle.prototype.area = function() {
          return this.width * this.height;
        }
        Rectangle.prototype.perimeter = function() {
          return 2 * (this.width + this.height);
        }
        Square = function(side) {
          Rectangle.call(this, side, side);
        }
        Square.prototype = Object.create(Rectangle.prototype, {
          constructor: {
            value: Square,
            writable: true,
            enumerable: false,
            configurable: true
          }
        });
        rectangle = new Rectangle(3, 4);
        square = new Square(5);
      });
      it('should have perimeter and area for both rectangle and square', function () {
         results = [rectangle.perimeter(), rectangle.area(), square.perimeter(), square.area()];
         expected = [14, 12, 20, 25];
         expect(results).toEqual(expected);
      });

      it('should identify constructors', function () {
         results = [rectangle instanceof Rectangle, square instanceof Square];
         expected = [true, true];
         expect(results).toEqual(expected);
      });
    });
    describe('Object.defineProperties', function () {
      let newPerson, me;
      beforeEach(() => {
        newPerson = function(name) {
          return Object.defineProperties({ name: name }, {
            log: {
              value: function() {
                return this.name;
              },
              writable: false,
              enumerable: true,
              configurable: true
            }
          });
        }
      });
      it('should return an object with a log method that cannot be changed', function () {
        me = newPerson('Shane Riley');
        expect(me.log()).toBe('Shane Riley');
        expect(() => { me.log = function() { return 'foo'; } }).toThrow(TypeError);
      });
    });
    describe('Object.freeze', function () {
      let frozen;
      beforeEach(() => {
        frozen = {
          integer: 4,
          string: 'String',
          array: [1, 2, 3],
          object: { foo: 'bar' },
          func: function() {
            return 'I am frozen.';
          }
        }
        Object.freeze(frozen);
      });
      it('should freeze non referential properties', function () {
        frozen.object.a = 1;
        expect(() => { frozen.integer = 8; }).toThrow(TypeError);
        expect(frozen.array.pop()).toBe(3);
        expect(frozen.object).toEqual({ foo: 'bar', a: 1 });
      });
    });
  }); 
});