describe('JS225 Object Oriented Javascript', function () {
  describe('Object Creation Pattern', function () {
    describe('Constructors, Prototypes, and the Prototype Chain', function () {
      let Animal, Dog, results, expected;
      beforeEach(() => {
        Animal = function(type) {
          this.type = type;
        }
        Animal.prototype.move = function() {
          return 'Animal is moving.'
        }
        Dog = function(name) {
          this.name = name;
        }
        Dog.prototype.say = function() {
          return this.name + ' says Woof!';
        }
        Dog.prototype.run = function() {
          return this.name + ' runs away.';
        }
      });
      describe('Use Object Returned by Animal Constructor', function () {
        let fido;
        beforeEach(() => {
          Dog.prototype = new Animal('land');
          fido = new Dog('Fido');
        });

        it('Using constructor call may delegate undesired properties', function () {
          expect(fido.type).toBe('land');
          /*
          It may be that the developer does not want the type property on any Dog object.  Note that Animal had a
          type property and since the Dog.prototype was set to the returned object from new Animal it was also
          given a reference to the type property.  But as we shall see below it is not an "own" property but a
          prototype property.  This way also does not do service to the idea of delegation.  Generally, we want to
          delegate behavior, though there are times we want to also delegate some ubiquitous properties to the object
          higher in the prototype chain.
           */
        });

        it('type is a prototype property', function () {
          results = ["type" in fido, fido.hasOwnProperty("type")];
          expected = [true, false];
          expect(results).toEqual(expected);
        });
      });
      describe('Use Object returned by Object Create', function () {
        let sounder;
        beforeEach(() => {
          Dog.prototype = Object.create(Animal.prototype);
          sounder = new Dog('Sounder');
        });

        it('with the above technique type is not delegated Dog', function () {
          results = [sounder.type, sounder.name];
          expected = [undefined, 'Sounder'];
          expect(results).toEqual(expected);
        });

        it('However constructor points back to Animal', function () {
          expect(Dog.prototype.constructor).toBe(Animal);
        });

        it('For Dog objects constructor set to animal', function () {
          expect(sounder.constructor).toBe(Animal);
          expect(sounder instanceof Dog).toBe(true);
        });
      });
      describe('Method One a more robust way for OLOO', function () {
        let bindi;
        beforeEach(() => {
          Dog.prototype = Object.create(Animal.prototype);
          Dog.prototype.constructor = Dog;
          bindi = new Dog('Bindi');
        });

        it('constructor now points to Dog', function () {
           expect(bindi.constructor).toBe(Dog);
        });
      });
    });
  }); 
});