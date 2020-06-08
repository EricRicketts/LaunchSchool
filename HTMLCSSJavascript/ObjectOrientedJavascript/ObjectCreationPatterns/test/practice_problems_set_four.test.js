import { Person, Triangle, User, createObject, neww, shape }
  from '../code/constructor_functions_and_prototypes_versioni_two';

describe('JS225 Object Oriented Javascript', function () {
  describe('Object Creation Patterns', function () {
    describe('Practice Problems Set Four', function () {
      describe('Constructor Functions and Prototypes: Set Two', function () {
        let results, expected, foo, bar;
        describe('Problem One: shape object and Triangle Prototype', function () {
          let t;
          beforeEach(() => {
            t = new Triangle(3, 4, 5);
          });
          it('should have all of the appropriate methods', function () {
            results = [
              t.constructor === Triangle, shape.isPrototypeOf(t),
              t.getPerimeter(), t.getType()
            ];
            expected = [true, true, 12, 'Triangle'];
            expect(results).toEqual(expected);
            /*
              My solution was the same as the Launch School solution but they had Triangle.prototype = shape, all else
              was the same as the Launch School solution.  I tend to always use Object.create as the argument is the
              object which will serve as the prototype for the return value.  One thing Launch School noted and I think
              it is very important.  Normally, the constructor is the set to the original function in this case, but
              remember the constructor is a property of the prototype of the function and these are the default
              values.  However, when we reassign the function's prototype, we loose the function that the original
              constructor was originally pointing to, so we have to reset it.
            */
          });
        });
        describe('Problem Two: constructor functions', function () {
          let name, user1, user2;
          beforeEach(() => {
            name = 'Jane Doe';
            user1 = new User('John', 'Doe');
            user2 = User('John', 'Doe');
          });
          it('should return all of the proper names', function () {
            results = [name, user1.name, user2.name];
            expected = ['Jane Doe', 'John Doe', 'John Doe'];
            expect(results).toEqual(expected);
          });
          it('Launch School solution', function () {
            function UserLS(first, last) {
              if (!(this instanceof User)) {
                return new User(first, last);
              }
              this.name = first + ' ' + last;
            }
            user1 = new UserLS('John', 'Doe');
            user2 = UserLS('John', 'Doe');
            results = [name, user1.name, user2.name];
            expected = ['Jane Doe', 'John Doe', 'John Doe'];
            expect(results).toEqual(expected);
            /*
              I like this solution much better than the one I had.  It shows a better understanding of what
              constructor functions actually are.  if this is not an instance of User then the constructor is
              called.  In essence the function body is entered again but this time this instanceof User is true
              so the name property is put on the object to be returned.  If the constructor is used from the
              outset then the name property is put on the returned object.
            */
          });
        });
        describe('Problem Three: a homegrown version of Object.create', function () {
          beforeEach(() => {
            foo = { a: 1 };
            bar = createObject(foo);
          });
          it('should create the proper prototype chain', function () {
            expect(foo.isPrototypeOf(bar)).toBe(true);
          });
          it('Launch School solution', function () {
            function createObjectLS(obj) {
              function F() {}
              F.prototype = obj;
              return new F();
            }
            bar = createObjectLS(foo);
            expect(foo.isPrototypeOf(bar)).toBe(true);
          });
        });
        describe('Problem Four: begetObject', function () {
          beforeEach(() => {
            foo = { a: 1 };
            foo.begetObject = function() {
              function F() {}
              F.prototype = this;
              return new F();
            }
            bar = foo.begetObject();
          });
          it('begetObject returns an object with the caller as the prototype', function () {
            expect(foo.isPrototypeOf(bar)).toBe(true);
          });
          it('my own alternative solution', function () {
            foo.begetObjectER = function() {
              return Object.setPrototypeOf({}, this);
            }
            bar = foo.begetObjectER();
            expect(foo.isPrototypeOf(bar)).toBe(true);
          });
        });
        describe('Problem Five: home grown new operator', function () {
          let john;
          beforeEach(() => {
            john = neww(Person, ['John', 'Doe']);
          });
          it('should operate like the new operator', function () {
            results = [john.greeting(), john.constructor];
            expected = ['Hello, John Doe', Person];
            expect(results).toEqual(expected);
            /*
              This is an important exercise.  My first inclination was correct I had to create a new object using
              the incoming constructor prototype.  So in order to imitate the new constructor call we need to
              create the proper prototype to assign to the newly created object.  We do this with the following code:
              let object = Object.create(constructor.prototype);  What I was having problems with was the
              assignment of the properties.  Well, we have the constructor function and now the appropriate object.
              We can now call the constructor function and pass in the correct object, which will then have its
              properties initialized => let result = constructor.apply(object, args);  Note the last line guarantees
              an object will be returned.  If the constructor is not a function then an object will be returned anyway.
            */
          });
        });
      }); 
    }); 
  });
});
