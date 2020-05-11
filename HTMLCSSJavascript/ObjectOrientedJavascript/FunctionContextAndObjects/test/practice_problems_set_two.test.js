QUnit.test('Problem 1:  window is the implicit global context for a function declared in the global scope', function (assert) {
  function func() {
    return this;
  }
  let context = func();
  assert.ok(context === window, 'in browser implicit global context, i.e., "this" is the window object');
});
QUnit.test('Problem 2:  Implicit execution context for a method is the owning object', function (assert) {
  let o = {
    func: function() {
      return this;
    }
  }

  let context = o.func();
  assert.ok(context === o, 'without an explicit override a method execution context is the calling object');
});
QUnit.test('Problem 3:  One can change the execution context of a function', function (assert) {
  window.message = 'Hello from the global scope!';

  function deliverMessage() {
    return this.message;
  }

  assert.ok(deliverMessage() === 'Hello from the global scope!', 'function called within global scope');

  let foo = {
    message: 'Hello from the function scope!',
  };

  foo.deliverMessage = deliverMessage;

  assert.ok(foo.deliverMessage() === 'Hello from the function scope!', 'function reassigned to object scope');
});
QUnit.test('Problems 4:  One can mix contexts in a statement', function (assert) {
  window.a = 10;
  let b = 10;
  let c = {
    a: -10,
    b: -10,
  };

  function add() {
    return this.a + b;
  }

  c.add = add;

  assert.ok(add() === 20, 'called in global context');
  assert.ok(c.add() === 0, 'called in method execution context but one variable is global');
});
/*
Problem 5: The problems above all feature implicit function execution context. What methods have we learned
so far that allow us to explicitly specify what a function's execution context should be?

Answer:
In terms of what Launch School has taught so far, 'call' and 'apply' are the functions used to explicitly
set the execution context.
 */
QUnit.test('Problem 6:  Use "call" to explicitly change the execution context', function (assert) {
  let foo = {
    a: 1,
    b: 2,
  };

  let bar = {
    a: 'abc',
    b: 'def',
    add: function() {
      return this.a + this.b;
    },
  };

  assert.ok(bar.add.call(foo) === 3, 'change execution context from default to foo');
});
QUnit.test('Problem 7:  Use "apply" to explicitly change the execution context', function (assert) {
  let fruitsObj = {
    list: ['Apple', 'Banana', 'Grapefruit', 'Pineapple', 'Orange'],
    title: 'A Collection of Fruit',
  };


  function outputList() {
    let firstElement = this.title + ':';

    let results = [].slice.call(arguments).reduce(function(arr, elem) {
      arr.push(elem);
      return arr;
    }, []);

    results.unshift(firstElement);
    return results;
  }

  let expected = ['A Collection of Fruit:', 'Apple', 'Banana', 'Grapefruit', 'Pineapple', 'Orange'];
  assert.deepEqual(outputList.apply(fruitsObj, fruitsObj.list), expected, 'use apply for arrayed inputs');
});
/*
Problem 8:  For an extra challenge, consider this line of code from the previous problem:

var args = [].slice.call(arguments);

Inside of JavaScript functions, arguments is an object that holds all of the arguments passed to the function.
Bearing in mind that the function author wants to iterate over the arguments later in the method using an Array
method, why do you think he or she is invoking call?


Answer:
The author is invoking call because he wants the args variable to be an array.  By invoking call with arguments
as the object, and using an empty array as the array and by not providing any arguments to the slice method
an array will be returns containing all of the arguments passed into outputList.
 */
