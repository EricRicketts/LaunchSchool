import { later, makeMultipleLister } from "../code/closures";

describe('JS225 Object Oriented Javascript Closures and Function Scope', function () {
  describe('Practice Problems Set Two Closures', function () {
    let expected, actual;
    it('Exercise 1: increment by the step size up to but not including 100', function () {
      expected = [13, 26, 39, 52, 65, 78, 91];
      let lister = makeMultipleLister(13);
      expect(lister()).toEqual(expected);
    });

    it('Exercise 2: functions close over local variables', function () {
      let start = 0;
      function add(increment) {
        return start += increment;
      }
      function subtract(decrement) {
        return start -= decrement;
      }
      actual = [add(1), add(42), subtract(39), add(6)];
      expected = [1, 43, 4, 10];
      expect(actual).toEqual(expected);
    });

    it('Exercise 3: capitalize the string', function () {
      let logWarning = later(String.prototype.toUpperCase, 'this system is shutting down!');
      expected = 'THIS SYSTEM IS SHUTTING DOWN!';
      expect(logWarning()).toBe(expected);
    });

    /*
    Exercise 4:
    We have the following code:

    function startup() {
    var status = 'ready';
      return function() {
        console.log('The system is ready.');
      };
    }

    var ready = startup();
    var systemStatus = // ?

    How can you set the value of systemStatus to the value of the inner variable status without
    changing startup in any way?

    Answer: in its current form the return function creates a closure over the local variable 'status'
    but there is no way to access the variable other than altering the startup function to somehow return it.
    We cannot access this variable from outside of the function according to the scoping rules of Javascript.
     */
  });
});
