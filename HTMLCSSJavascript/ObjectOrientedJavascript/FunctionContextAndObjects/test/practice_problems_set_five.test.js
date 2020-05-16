function whatIsMyContext() {
  return this;
}

function foo() {
  function bar() {
    function baz() {
      return this;
    }
    return baz();
  }
  return bar();
}

let obj = {
  count: 2,
  method: function() {
    return this.count;
  }
}

window.a = 2;
function anotherFoo() {
  return this.a;
}

function bar() {
  return this.a;
}

let anotherObj = {
  a: 1,
  foo: bar
}

let fooObj = {
  a: 1,
  bar: function() {
    return this.baz();
  },
  baz: function() {
    return this;
  }
}
/*
At this point we do not know what "this" is because the function is only being defined and not
run, the value for "this" is dependent on the execution context for the function.
 */
QUnit.test('Problems 1 and 2: implicit functional context is global', function (assert) {
  assert.strictEqual(whatIsMyContext(), window, '"this" the execution context is window in the browser');
  /*
  In this case we have a function called globally, or global execution context for a function.  In this case
  it sets the execution context to the implicit global object, which in the case of the browser is the window
  object.  When the global object is used to implicitly call a function, we call this the global context.
   */
});
QUnit.test('Problems 3: implicit functional context remains even with nested functions', function (assert) {
  assert.strictEqual(foo(), window, '"this" is the window object when call to "this" is nested');
});
QUnit.test('Problem 4: implicit method context means "this" is the calling object', function (assert) {
  assert.strictEqual(obj.method(), 2);
});
QUnit.test('Problem 5: adding a variable to the global object', function (assert) {
  assert.strictEqual(anotherFoo(), 2);
});
QUnit.test('Problem 6: A function assigned to an object assumed implicit method context', function (assert) {
  assert.strictEqual(anotherObj.foo(), 1);
  /*
  so the stand alone function bar when called by itself has a global scope, but when it is assigned as a property
  to the anotherObj object, when anotherObj.foo() is called, which calls bar, the function assumes method invocation
  context.
   */
});
QUnit.test('Problem 7: within a method, "this" is always the owning object', function (assert) {
  assert.strictEqual(fooObj.bar(), fooObj);
  let qux = fooObj.bar;
  assert.throws(function() { qux(); }, TypeError, 'baz is out of scope');
  /*
  when calling fooObj.bar(), we call this.baz(), however, when fooObj.bar is assigned to qux and when qux is invoked,
  it calls baz via this.baz().  However, qux is globally executed as it is not assigned to an object, so window
  does not have a qux property, so a TypeError is thrown.
   */
});