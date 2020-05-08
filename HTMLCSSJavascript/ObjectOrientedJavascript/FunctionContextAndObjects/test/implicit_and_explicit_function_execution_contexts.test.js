QUnit.test('basic implicit function execution context', function (assert) {
  function foo() {
    return 'this here is: ' + this;
  }
  assert.strictEqual(foo(), 'this here is: [object Window]', 'default "this" refers to window object in browser');
});
QUnit.test('binding a function to a context occurs when you invoke a function and not when defined', function (assert) {
  let obj = {
    foo: function() {
      return 'this here is: ' + this;
    }
  }

  let expected = 'this here is: [object Object]';
  assert.strictEqual(obj.foo(), expected, '"this" refers to the object in method execution context');

  let bar = obj.foo; // assign a function to variable bar; but bar is a global variable
  expected = 'this here is: [object Window]';
  assert.strictEqual(bar(), expected, '"this" refers to window object in global execution context');
});
QUnit.test('basic implicit method execution context', function (assert) {
  let foo = {
    bar: function() {
      return this;
    }
  }

  assert.ok(foo.bar() === foo, 'default "this" refers to the calling object');
});
QUnit.test('binding a method to an object occurs at invocation and not when defined', function (assert) {
  let foo = {
    bar: function() {
      return this;
    }
  }

  let baz = foo.bar;
  assert.ok(baz() === window, 'foo.bar is a function when assigned to baz, so function execution context is used');
  assert.notOk(baz() === foo, 'as a function the implicit execution context is the global object, not the original object');
});
QUnit.test('Explicit function execution context, using the call function', function (assert) {
  var a = 1;
  window.a = a;
  function foo() {
    return this.a;
  }
  function bar() {
    return this;
  }
  let strings = {
    a: 'hello',
    b: 'world',
    foo: function() {
      return this.a + this.b;
    }
  }
  let numbers = {
    a: 1,
    b: 2
  }

  assert.ok(globalThis === window, 'checking default global object');
  assert.ok(foo() === 1, 'calling in global context (implicit), variable a is a property on the window global object');
  assert.ok(foo.call(strings) === 'hello', 'explicit execution context, "this" is not strings object');
  assert.ok(strings.foo.call(numbers) === 3, 'change string output into numeric output using call');
});
QUnit.test('Explicit function execution context using call and apply with arguments', function (assert) {
  let iPad = {
    name: 'iPad',
    price: 40000,
  };
  let kindle = {
    name: 'kindle',
    price: 30000,
  };

  function printLine(lineNumber, punctuation) {
    return lineNumber + ': ' + this.name + ', ' + this.price / 100 + ' dollars' + punctuation;
  }

  let iPadExpected = '1: iPad, 400 dollars.';
  let kindleExpected = '2: kindle, 300 dollars.';
  assert.ok(printLine.call(iPad, 1, '.') === iPadExpected, 'call with arguments');
  assert.ok(printLine.apply(kindle, [2, '.']) === kindleExpected, 'apply with arguments');
});