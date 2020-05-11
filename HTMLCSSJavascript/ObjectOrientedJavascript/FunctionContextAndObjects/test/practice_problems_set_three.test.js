/*
Problem 1:  What function can we use to permanently bind a function to a particular execution context?

Answer:
The bind function permanently binds a function to a particular execution context, but the important difference
between call and apply is that bind returns a function and not the result of calling the function.
 */
QUnit.test('Problems 2:  Hard Binding Functions With Contexts', function (assert) {
  let obj = {
    message: 'Javascript'
  }
  function foo() {
    return this.message;
  }

  assert.ok(typeof foo.bind(obj) === 'function', '[function foo]', 'bind returns a function bound to an object');
});
QUnit.test('Problem 3:  Hard binding switch context between global and object', function (assert) {
  window.a = 1;
  window.b = -1;

  let obj = {
    a: 2,
    b: 3
  };
  function foo() {
    return this.a + this.b;
  }

  let bar = foo.bind(obj);
  assert.strictEqual(foo(), 0, 'global context');
  assert.strictEqual(bar(), 5, 'bar permanently bound to obj');
});
QUnit.test('Problem 4:  Use bind to add a method to an object', function (assert) {
  let positiveMentality = {
    message: 'Javascript makes sense!'
  }
  let negativeMentality = {
    message: 'Javascript makes no sense!'
  }
  function foo() {
    return this.message;
  }

  let bar = foo.bind(positiveMentality);
  negativeMentality.logMessage = bar;
  assert.strictEqual(negativeMentality.logMessage(), 'Javascript makes sense!');
});
QUnit.test('Problem 5:  Bind has a permanent affect on the returned function', function (assert) {
  let obj = {
    a: 'Amazebulous!'
  }
  let otherObj = {
    a: "That's not a real word!"
  }
  function foo() {
    return this.a;
  }
  let bar = foo.bind(obj);
  assert.strictEqual(bar(), 'Amazebulous!');
  assert.strictEqual(bar.call(otherObj), 'Amazebulous!', 'bar is permanently function foo permanently bound to obj');
});