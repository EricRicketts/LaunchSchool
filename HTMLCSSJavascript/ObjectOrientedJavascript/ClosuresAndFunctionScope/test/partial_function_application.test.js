describe('JS225 Object Oriented Javascript Closures and Function Scope', function () {
  describe('Partial Function Application', function () {
    let greet, partial, actual, expected;
    beforeEach(() => {
      greet = function(greeting, name) {
        let replacer = function(p) { return p.toUpperCase(); }
        return greeting.replace(/^(\w)/, replacer) + ', ' + name + '!';
      }

      partial = function(primary, greeting) {
        return function(name) {
          return primary(greeting, name);
        }
      }
    });

    it('greet should capitalize the greeting', function () {
       actual = [greet('howdy', 'Joe'), greet('good morning', 'Sue')];
       expected = ['Howdy, Joe!', 'Good morning, Sue!'];
       expect(actual).toEqual(expected);
    });

    it('Use primary to create specific greetings for any name', function () {
      let sayHello = partial(greet, 'hello');
      let sayHi = partial(greet, 'hi');
      actual = [sayHello('Brandon'), sayHi('Sarah')];
      expected = ['Hello, Brandon!', 'Hi, Sarah!'];
      expect(actual).toEqual(expected);
    });
  }); 
});