describe('Exercises JS225 Object Oriented Javascript Function Context, Scope, and Closure', function () {
  describe('Exercise Two', function () {
    let franchiseError, franchiseFixed, franchiseArrowFunction, franchiseHardBound, expected;
    beforeEach(() => {
      expected = [
        'How to Train Your Dragon 1',
        'How to Train Your Dragon 2',
        'How to Train Your Dragon 3',
      ];
      franchiseError = {
        name: 'How to Train Your Dragon',
        allMovies: function() {
          return [1, 2, 3].map(function(number) {
            return this.name + ' ' + number;
          });
        }
      }
      franchiseFixed = {
        name: 'How to Train Your Dragon',
        allMovies: function() {
          return [1, 2, 3].map(function(number) {
            return this.name + ' ' + number;
          }, this);
        }
      }
      franchiseArrowFunction = {
        name: 'How to Train Your Dragon',
        allMovies: function() {
          return [1, 2, 3].map((number) => this.name + ' ' + number);
        }
      }
      franchiseHardBound = {
        name: 'How to Train Your Dragon',
        allMovies: function() {
          let versions = function (number) {
            return this.name + ' ' + number;
          }.bind(this);
          return [1, 2, 3].map(versions);
        }
      }
    });

    it('should produce incorrect output due to implicit execution context', function () {
      expect(() => { franchiseError.allMovies(); }).toThrow(TypeError);
      /*
      we get the result because in strict mode, "this" defaults to undefined, when we use a function expression
      for map, this does not default to the array object, but to the global value of "this".  In the browser we
      would get ['undefined 1', 'undefined 2', 'undefined 3'] because the global object would be the window object
      which does not have a name property as far as I know.
       */
    });

    it('fix the allMovies method by assigning an explicit value of this for map', function () {
      expect(franchiseFixed.allMovies()).toEqual(expected);
      /*
      The fixed worked because I passed into the map function an explicit value for "this" which the map
      function allows as an optional argument.
       */
    });

    it('arrow function takes calling object as this by default', function () {
      expect(franchiseArrowFunction.allMovies()).toEqual(expected);
    });

    it('force an explicit binding to solve the problem', function () {
      expect(franchiseHardBound.allMovies()).toEqual(expected);
    });

    it('one more way of hard binding', function () {
      let franchise = {
        name: 'How to Train Your Dragon',
        allMovies: function() {
          return [1, 2, 3].map(function(number) {
            return this.name + ' ' + number;
          }.bind(this));
        }
      }
      expect(franchise.allMovies()).toEqual(expected);
    });
  });
});