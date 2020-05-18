describe('JS225 Object Oriented Javascript Closures And Function Scope', function () {
  describe('Practice Problems: Higher Order Functions', function () {
    /*
      1.  What are the characteristics that defined higher-order functions?
      Higher order functions can accept functions as arguments, return functions as values or do both.
    */
    let checkEven, numbers, expected, makeCheckEven;
    beforeEach(() => {
      numbers = [1, 2, 3, 4];
      expected = [2, 4];
      checkEven = function(number) {
        return number % 2 === 0;
      }
      makeCheckEven = function() {
        return function(number) {
          return number % 2 === 0;
        }
      }
    });

    it('Exercise 2: Array filter is a higher order function', function () {
      expect(numbers.filter(checkEven)).toEqual(expected);
      /*
        filter is the higher order function because it takes a function as an argument.  A higher order
        function must do at least one of the following take a function as an argument, return a function,
        or it can do both.  checkEven neither takes a function as an argument or does it return a function.
      */
    });

    it('Exercise 3: makeCheckEven returns a function', function () {
      checkEven = makeCheckEven();
      expect(numbers.filter(checkEven)).toEqual(expected);
      /*
        when called makeCheckEven returns a function, so it is a higher order function, since functions
        are first class citizens in Javascript they can be passed around just like any other value.  So,
        filter can now call the variable checkEven because it is a function.
      */
    });

    it('Exercise 4: execute function', function () {
      function execute(func, operand) {
        return func(operand);
      }
      let firstResult = execute(function(number) {
        return number * 2;
        }, 10);
      let secondResult = execute(function(string) {
        return string.toUpperCase();
      }, 'hey there buddy');
      expect([firstResult, secondResult]).toEqual([20, 'HEY THERE BUDDY']);
      /*
        I was a bit confused before I figured the problem out, I thought we were dealing
        with an IIFE but in reality we were dealing with a normal function declaration, where the
        first argument is a function and the second argument is the argument for the incoming function.
      */
    });

    it('Exercise 5: makeTransformerList calls map', function () {
      function makeTransformerList(func) {
        return function(arr) {
          return arr.map(func);
        }
      }
      let timesTwo = makeTransformerList(function(number) {
        return number * 2;
      });
      expect(timesTwo(numbers)).toEqual([2, 4, 6, 8]);
      /*
        in this case we know an array will be passed into the timesTwo variable, so makeTransformList has to
        return a function that accepts an array as an argument.
      */
    });
  });
  
});