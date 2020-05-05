let People = (function() {
  function isInvalidPerson(person) {
    return typeof person.firstName !== 'string' || typeof person.lastName !== 'string';
  }

  function checkPersonByFullName(currentPerson, person) {
    return currentPerson.firstName === person.firstName && currentPerson.lastName === person.lastName;
  }

  function getIndex(collection, person) {
    return collection.findIndex((currentPerson) => {
      if (person.id !== undefined) {
        return currentPerson.id === person.id && checkPersonByFullName(currentPerson, person);
      } else {
        return checkPersonByFullName(currentPerson, person);
      }
    });
  }

  function People() {
    this.collection = [];
    this.personalId = 0;
  }

  People.prototype = {
    constructor: People,
    add: function(person) {
      if (isInvalidPerson(person)) { return undefined; }
      person.id = this.personalId;
      this.incrementPersonalId();
      return this.collection.push(person);
    },
    get: function(person) {
      if (isInvalidPerson(person)) { return undefined; }
      let foundIndex = getIndex(this.collection, person);
      return foundIndex === -1 ? foundIndex : this.collection[foundIndex];
    },
    fullName: function(person) {
     return person.firstName + ' ' + person.lastName;
    },
    incrementPersonalId: function() {
      return this.personalId += 1;
    },
    remove: function(person) {
      if (isInvalidPerson(person)) { return undefined; }
      let foundIndex = getIndex(this.collection, person);
      return foundIndex === -1 ? foundIndex : this.collection.splice(foundIndex, 1);
    },
    rollCall: function() {
      return this.collection.reduce((list, person) => {
        list.push(this.fullName(person));
        return list;
      }, []);
    }
  }

  return People;
})();

export { People };