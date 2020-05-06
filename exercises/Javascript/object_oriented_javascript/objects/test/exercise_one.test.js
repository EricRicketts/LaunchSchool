describe('Exercises JS225 Object Oriented Javascript Objects Exercise One', function () {
  let createGreeter, flawedGreet, correctGreet;
  beforeEach(() => {
    createGreeter = function(name) {
      return {
        name: name,
        morning: 'Good Morning',
        afternoon: 'Good Afternoon',
        evening: 'Good Evening',
      };
    }
    flawedGreet = function (timeOfDay) {
      let msg = '';
      switch (timeOfDay) {
        case 'morning':
          msg += morning + ' ' + name;
          break;
        case 'afternoon':
          msg += afternoon + ' ' + name;
          break;
        case 'evening':
          msg += evening + ' ' + name;
          break;
      }
      return msg;
    }

    correctGreet = function (timeOfDay) {
      let msg = '';
      switch (timeOfDay) {
        case 'morning':
          msg += this.morning + ' ' + this.name;
          break;
        case 'afternoon':
          msg += this.afternoon + ' ' + this.name;
          break;
        case 'evening':
          msg += this.evening + ' ' + this.name;
          break;
      }
      return msg;
    }
  });

  it('should throw a reference error as properties must be called with "this"', function () {
    let helloVictor = createGreeter('Victor');
    helloVictor.greet = flawedGreet;
    expect(() => { helloVictor.greet('morning')}).toThrow(ReferenceError);
  });

  it('should greet when referencing "this"', function () {
    let helloVictor = createGreeter('Victor');
    helloVictor.greet = correctGreet;
    expect(helloVictor.greet('morning')).toBe('Good Morning Victor');
  });
});