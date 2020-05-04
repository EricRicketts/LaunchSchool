describe('JS225 Object Oriented Javascript: Walkthrough: Object Methods', function () {
  let me, friend, mother, father, expectedRollCall;
  function fullName(person) {
    return person.firstName + ' ' + person.lastName;
  }
  function rollCallVersionThree(collection) {
    return collection.reduce((acc, item) => {
      acc.push(fullName(item));
      return acc;
    }, []);
  }
  beforeEach(() => {
    me = { firstName: 'Jane', lastName: 'Doe' };
    friend = { firstName: 'John', lastName: 'Smith' };
    mother = { firstName: 'Amber', lastName: 'Doe' };
    father = { firstName: 'Shane', lastName: 'Doe' };
    expectedRollCall = ['Jane Doe', 'John Smith', 'Amber Doe', 'Shane Doe'];
  });
  describe('Create separate objects, functions, and collection', function () {
    let anotherMe, people;
    function rollCallVersionOne(collection) {
      let collectionLength = collection.length;
      let rollCallAry = [];
      for (let i = 0; i < collectionLength; i += 1) {
        rollCallAry.push(fullName(collection[i]));
      }
      return rollCallAry;
    }
    function rollCallVersionTwo(collection) {
      let rollCallAry = [];
      collection.forEach((item) => {
        rollCallAry.push(fullName(item));
      });
      return rollCallAry;
    }
    beforeEach(() => {
      anotherMe = {};
      people = [];
      people.push(me, friend, mother, father);
    });
    it('we can add properties at anytime during the life of an object', function () {
      anotherMe.firstName = 'Jane';
      anotherMe.lastName =  'Doe';
      expect(me).toEqual(anotherMe);
    });

    it('function fullName requires the object to have the appropriate properties', function () {
      expect(fullName(me)).toBe('Jane Doe');
      expect(fullName(friend)).toBe('John Smith');
    });

    it('rollCall version one', function () {
      expect(rollCallVersionOne(people)).toEqual(expectedRollCall);
    });

    it('rollCall version two', function () {
      expect(rollCallVersionTwo(people)).toEqual(expectedRollCall);
    });

    it('rollCall version three', function () {
      expect(rollCallVersionThree(people)).toEqual(expectedRollCall);
    });
  });
  describe('Encompass functionality into an object', function () {
    let people, person, invalidPerson;
    beforeEach(() => {
      people = {
        collection: [me, friend, mother, father],
        add: function(person) {
          return this.isInvalidPerson(person) ? undefined : this.collection.push(person);
        },
        fullName: function(person) {
          return person.firstName + ' ' + person.lastName;
        },
        get: function(person) {
          if (this.isInvalidPerson(person)) {
            return undefined;
          } else {
            let index = this.getIndex(person);
            return index === -1 ? index: this.collection[this.getIndex(person)];
          }
        },
        getIndex: function(personToFind) {
          return this.collection.findIndex((person) => {
            return person.firstName === personToFind.firstName &&
              person.lastName === personToFind.lastName;
          });
        },
        isInvalidPerson: function(person) {
          return typeof person.firstName !== 'string' || typeof person.lastName !== 'string';
        },
        numberOfPeople: function() {
          return this.collection.length;
        },
        remove: function(person) {
          if (this.isInvalidPerson(person)) {
            return undefined;
          } else {
            let index = this.getIndex(person);
            return index === -1 ? index : this.collection.splice(index, 1);
          }
        },
        rollCall: function() {
          return this.collection.reduce((acc, person) => {
            acc.push(this.fullName(person));
            return acc;
          }, []);
        },
        update: function(person) {
          if (this.isInvalidPerson(person)) {
            return undefined;
          } else {
            let index = this.getIndex(person);
            return index === -1 ? this.add(person) : this.collection[index] = person;
          }
        }
      }
    });
    it('person object should return a full name', function () {
      person = people.collection[0];
      expect(people.fullName(person)).toBe('Jane Doe');
    });

    it('should perform a roll call', function () {
      expect(people.rollCall()).toEqual(expectedRollCall);
    });

    it('should add to the collection of people', function () {
      let peopleCount = [];
      let anotherPerson = { firstName: 'Elmer', lastName: 'Fudd' };
      peopleCount.push(people.numberOfPeople());
      people.add(anotherPerson);
      peopleCount.push(people.numberOfPeople());
      expect(peopleCount).toEqual([4, 5]);
    });

    it('should identify those in the collection and those not in the collection', function () {
      let validPerson = people.collection[2];
      let invalidPerson = { firstName: 45, lastName: 'Duck' };
      let results = [people.isInvalidPerson(validPerson), people.isInvalidPerson(invalidPerson)];
      expect(results).toEqual([false, true]);
    });

    it('should identify the index of a person, or if the person is not included return -1', function () {
      person = people.collection[3];
      let personNotInCollection = { firstName: 'Elmer', lastName: 'Fudd' };
      let actual = [people.getIndex(person), people.getIndex(personNotInCollection)];
      expect(actual).toEqual([3, -1]);
    });

    it('should not add a person if the person is invalid', function () {
      invalidPerson = { firstName: true, lastName: 'Sam' };
      expect(people.add(invalidPerson)).toBe(undefined);
    });

    it('should not attempt to remove an invalid person', function () {
      invalidPerson = { firstName: undefined, lastName: 'Leghorn' };
      expect(people.remove(invalidPerson)).toBe(undefined);
    });

    it('should return -1 if the person is valid but not in the collection', function () {
      person = { firstName: 'Elmer', lastName: 'Fudd' };
      expect(people.remove(person)).toBe(-1);
    });

    it('if the person is in the collection, removal should return the person object removed', function () {
      person = { firstName: 'John', lastName: 'Smith' };
      expect(people.remove(person)).toEqual([person]);
    });

    it('should return undefined for finding a person if the person has invalid format', function () {
      invalidPerson = { firstName: 'Bugs', lastName: BigInt(43) };
      expect(people.get(invalidPerson)).toBe(undefined);
    });

    it('retrieving a person should return -1 if the person is valid and does not exist', function () {
      person = { firstName: 'Yosemite', lastName: 'Sam' };
      expect(people.get(person)).toBe(-1);
    });

    it('should retrieve the person object is the person is valid and in the collection', function () {
      person = { firstName: 'Amber', lastName: 'Doe' };
      expect(people.get(person)).toEqual(person);
    });

    it('should return undefined if the person to be updated is invalid', function () {
      invalidPerson = { firstName: 'Porky', lastName: Symbol('Pig') };
      expect(people.update(invalidPerson)).toBe(undefined);
    });

    it('should add the person to the collection if the person is valid but not in the collection', function () {
      person = { firstName: 'Bugs', lastName: 'Bunny' };
      expect(people.update(person)).toBe(5);
    });

    it('should allow for modification of the person when updating if the person is in the collection', function () {
      person = { firstName: 'Shane', lastName: 'Doe', occupation: 'Programmer' };
      people.update(person);
      expect(people.get(person)).toEqual(person);
    });
  });
});