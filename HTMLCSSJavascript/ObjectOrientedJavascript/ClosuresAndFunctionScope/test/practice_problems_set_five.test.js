describe('JS225 Object Oriented Javascript Closures and Function Context', function () {
  describe('Practice Problems Set Five IIFE', function () {
    /*
      1.  Will the code below execute?
      function() {
        return 'Sometimes, syntax is not intuitive!';
      }();
      No a syntax error will be thrown a function declaration needs a function name and it cannot be executed
      immediately
    */
    let numbers, countdown, countdownTwo, expected;
    beforeEach(() => {
      numbers = [1, 7, -3, 3];
      countdown = function(start) {
        return (function(start) {
          let ary = [];
          for (let i = start; i >= 0; i -= 1) {
            ary.push(i);
          }
          ary.push('Done!');
          return ary.join('\n');
        })(start);
      }
      countdownTwo = function(start) {
        let ary = [];
        (function countdown(start) {
          ary.push(start)
          if (start > 0) {
            return countdown(start - 1);
          } else {
            ary.push('Done!');
          }
        })(start);
        return ary.join('\n');
      }
    });
    it('Problem 2: fix problem 1', function () {
      let str = (function() { return 'Sometimes, syntax is not intuitive!'; })();
      expect(str).toBe('Sometimes, syntax is not intuitive!');
    });

    it('incorrectly redefining a numeric variable to a function', function () {
      var sum = 0;
      sum += 10;
      sum += 31;
      function sum(arr) {
        return arr.reduce(function(sum, number) {
          sum += number;
          return sum;
        }, 0);
      }
      expect(() => { sum += sum(numbers); }).toThrow(TypeError);
      /*
      We have a TypeError because the variable sum was redefined to be a function in lines 24-29 and one
      cannot do addition operations on a function as we do in line 30.
      */
    });

    it('fix the above assertion with an IIFE', function () {
      var sum = 0;
      sum += 10;
      sum += 31;
      let sumNumbers = (function(arr) {
        return arr.reduce((sum, number) => sum + number, 0);
      })(numbers);
      expect(sum + sumNumbers).toBe(49);
    });

    it('should perform a countdown', function () {
      expected = '7\n6\n5\n4\n3\n2\n1\n0\nDone!';
      expect(countdown(7)).toBe(expected);
    });

    it('naming IIFE\'s does not make the identifier callable', function () {
      (function foo() {
        return 'bar';
      })();
      expect(() => { foo(); }).toThrow(ReferenceError);
      // though the IIFE is named this name is not available outside of the scope of the IIFE
    });

    it('should countdown by recursion', function () {
      expected = '7\n6\n5\n4\n3\n2\n1\n0\nDone!';
      expect(countdownTwo(7)).toBe(expected);
    });
  });
});