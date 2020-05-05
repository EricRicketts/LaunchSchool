import { People } from "../code/enhanced_people";

describe('JS225 Object Oriented Javascript: Walkthrough: Object Methods: Enhanced ', function () {
  let me, friend, mother, father, expected, actual, invalidPerson, person;
  beforeEach(() => {
    [me, friend] = [{ firstName: 'Jane', lastName: 'Doe' }, { firstName: 'John', lastName: 'Smith'}];
    [mother, father] = [{ firstName: 'Amber', lastName: 'Doe' }, {firstName: 'Shane', lastName: 'Doe' }];
  });

  describe('Adding to the collection', function () {
    let people;
    beforeEach(() => {
      people = new People();
    });
    it('should return undefined if the person to be added is invalid', function () {
      invalidPerson = { firstName: 43, lastName: 'Bar' };
      expect(people.add(invalidPerson)).toBe(undefined);
    });

    it('privileged methods are not public', function () {
      invalidPerson = { firstName: 43, lastName: 'Bar' };
      expect(() => { people.isInvalidPerson(invalidPerson) }).toThrow(TypeError);
    });

    it('should add persons to the collection, with correct id properties', function () {
      let size = 0;
      [me, friend].forEach((person) => {
        size = people.add(person);
      });
      actual = [size, people.collection[0], people.collection[1]];
      expected = [2, { firstName: 'Jane', lastName: 'Doe', id: 0 }, { firstName: 'John', lastName: 'Smith', id: 1 }];
      expect(actual).toEqual(expected);
    });
  });

  describe('Collection roll call, get a person, remove a person', function () {
    let people, actual, expected;
    beforeEach(() => {
      people = new People();
      [me, friend, mother, father].forEach((person) => {
        people.add(person);
      });
    });

    describe('Roll Call', function () {
      it('should run a roll call of all people', function () {
        actual = people.rollCall();
        expected = ['Jane Doe', 'John Smith', 'Amber Doe', 'Shane Doe'];
        expect(actual).toEqual(expected);
      });
    });

    describe('Get a person', function () {
      let people;
      beforeEach(() => {
        people = new People();
        [me, friend, mother, father].forEach((person) => {
          people.add(person);
        });
      });
      it('should return undefined if the person is not valid', function () {
        invalidPerson = { firstName: 'Foo', lastName: BigInt(432) };
        expect(people.get(invalidPerson)).toBe(undefined);
      });

      it('should return -1 if the person is valid and not in the collection', function () {
        person = { firstName: 'Daffy', lastName: 'Duck' };
        expect(people.get(person)).toBe(-1);
      });

      it('should return the person if in the collection', function () {
        expected = { firstName: 'Amber', lastName: 'Doe', id: 2 };
        expect(people.get({ firstName: 'Amber', lastName: 'Doe' })).toEqual(expected);
      });
    });

    describe('Remove a person', function () {
      let people;
      beforeEach(() => {
        people = new People();
        [me, friend, mother, father].forEach((person) => {
          people.add(person);
        });
      });
      it('should return undefined if the person is not valid', function () {
        invalidPerson = { firstName: Symbol('foo'), lastName: 'Bar' };
        expect(people.remove(invalidPerson)).toBe(undefined);
      });

      it('should return -1 if the person is valid but not in the collection', function () {
        person = { firstName: 'Foghorn', lastName: 'Leghorn' };
        expect(people.remove(person)).toBe(-1);
      });

      it('should remove a person from the collection', function () {
        person = { firstName: 'John', lastName: 'Smith' };
        let currentCollectionSize = people.collection.length;
        people.remove(person);
        let newCollectionSize = people.collection.length;
        expect(currentCollectionSize - 1).toBe(newCollectionSize);
      });

      it('should return the removed person in an array', function () {
        person = { firstName: 'Jane', lastName: 'Doe' };
        actual = people.remove(person);
        expected = { firstName: 'Jane', lastName: 'Doe', id: 0 };
        expect(actual).toEqual([expected]);
      });
    });
  });
});