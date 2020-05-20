describe('JS225 Object Oriented Javascript Function Context, Scopes, and Closures', function () {
  describe('Exercises Problem One', function () {
    let person, secondPerson;
    beforeEach(() => {
      person = {
        firstName: 'Rick',
        lastName: 'Sanchez',
        fullName: this.firstName + this.firstName
      }
      secondPerson = {
        firstName: 'Rick',
        lastName: 'Sanchez',
        fullName: function() {
          return this.firstName + ' ' + this.lastName;
        }
      }
    });

    it('person should throw a TypeError', function () {
      expect( person.fullName).toBeNaN();
      /*
        I thought a TypeError would be thrown initially, however, the Launch School answer really cleared up
        the NaN output.  This is context dependent when it is inside of a function, outside of a function, this
        always takes on the value of the global object.  In this case the global object does not have firstName
        and lastName properties, so the resulting addition is undefined + undefined which yields NaN.
      */
    });

    it('secondPerson should work as expected', function () {
      expect(secondPerson.fullName()).toBe('Rick Sanchez');
    });
  });
});