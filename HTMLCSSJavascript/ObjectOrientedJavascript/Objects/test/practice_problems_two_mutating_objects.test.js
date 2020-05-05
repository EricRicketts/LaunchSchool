describe('JS225 Object Oriented Javascript Practice Problems Two Mutating Objects', function () {
  describe('Pass a primitive value into a function', function () {
    let message, expected;
    function func(message) {
      message = 'Hello from the function scope!';
      return message;
    }

    it('assignment within a function does not change primitive types', function () {
      message = 'Hello from the global scope!';
      expected = ['Hello from the function scope!', 'Hello from the global scope!'];
      let result = func(message);
      expect([result, message]).toEqual(expected);
    });

    it('copying variables holding primitives puts another value on the stack, ', function () {
      message = 'first iteration';
      let secondMessage = message;
      /*
      message and secondMessage hold the same primitive value, however two different positions on the stack now hold
      this same primitive value
       */
      expect([message, secondMessage]).toEqual(['first iteration', 'first iteration']);
      message = 'second iteration';
      /*
      now message is assigned a new primitive value, but it still has its position on the stack which is
      different from the position of secondMessage.  This reassignment has no affect of secondMessage
      which is on a different position on the stack with its original value of 'first iteration'
       */
      expect([message, secondMessage]).toEqual(['second iteration', 'first iteration']);
    });
  });

  describe('Pass a reference value into a function', function () {
    let myObj, expected;
    function func(obj) {
      obj.message = 'Greetings from the function scope!';
      return obj.message;
    }

    it('should pass an object by reference', function () {
      myObj = { message: 'Greetings from the global scope!' };
      let myObjCopy = Object.assign({}, myObj);
      func(myObj);
      expected = ['Greetings from the global scope!', 'Greetings from the function scope!'];
      expect([myObjCopy.message, myObj.message]).toEqual(expected);
      /*
      though there stack positions are different, myObj and obj within func both point to the same
      location in memory, and this location contains myObj.  So, myObj is changed because obj
      points to the same location in memory even though it is a variable within func.  This is because
      Javascript passes parameters by reference.
       */
    });
  });

  describe('Global variables', function () {
    let message;
    function func() {
      message = 'Hello from the function scope!';
      return message;
    }

    it('changing values of global variables changes their values everywhere', function () {
      message = 'Hello from the global scope!';
      expect(message).toBe('Hello from the global scope!');
      func();
      expect(message).toBe('Hello from the function scope!');
    });
  });

  describe('Changing properties of objects', function () {
    let a, obj;

    it('Object property referencing a primitive does not change the primitive ', function () {
      a = 10;
      obj = { a: a };
      let newObj = obj;
      newObj.a += 10;
      expect(newObj.a === a).toBe(false);
      expect(newObj === obj).toBe(true);
      /*
        any changes in newObj will change obj and vice versa as they both point to the same object in memory.
        In the case of obj.a and newObj.a on line 78 we have a reassignment which puts a new value onto the
        stack, maintaining the original value of a.  As Launch School states reassignment of properties on
        an object does not break the reference to the object in memory.
       */
    });
  });

  describe('Object mutability', function () {
    let animal, menagerie;
    beforeEach(() => {
      animal = {
        name: 'Pumbaa',
        species: 'Phacochoerus africanus',
      };
      menagerie = {
        warthog: animal,
      };
    });

    it('should ', function () {
      animal = {
        name: 'Timom',
        species: 'Suricata suricatta',
      };
      menagerie.meerkat = animal;
      expect(menagerie.meerkat === animal).toBe(true);
      expect(menagerie.warthog === animal).toBe(false);
      /*
      though objects are mutable what we have in lines 103 through 106 is the assignment of a new
      object to the animal variable.  So animal is now pointing to a different object in memory, whereas
      menagerie.warthog is pointing to the original location in memory where animal was first defined.  Note
      lines 103 - 106 did not change any properties, it was a complete reassignment.  We could have achieved
      the same results with Object.create().
       */
    });
  });
});