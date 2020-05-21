describe('Exercises JS225 Object Oriented Javascript Function Contexts, Scopes and Closures', function () {
  describe('Exercise Nine', function () {
    let greeter, greeterLS;
    beforeEach(() => {
      greeter = (function(name, greeting) {
        return {
          message: greeting + ' ' + name + '!',
          sayGreetings: function() {
            return this.message;
          }
        }
      })('Naveed', 'Hello');
      greeterLS = {
        message: (function() {
           let name = 'Naveed';
           let greeting = 'Hello';

           return greeting + ' ' + name + '!';
        })(),
        sayGreetings: function() {
          return this.message;
        }
      }
    });

    it('should return the greetings having not polluted the global scope', function () {
      expect(greeter.sayGreetings()).toBe('Hello Naveed!');
    });

    it('LS solution encapsulates the local variables into the message property', function () {
      expect(greeterLS.sayGreetings()).toBe('Hello Naveed!');
    });
  });
});