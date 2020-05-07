QUnit.test('ok test', function (assert) {
  assert.ok(true, 'true succeeds');
});
QUnit.test('global window object', function (assert) {
  assert.ok(typeof window === 'object', 'global window provided');
  /*
  As demonstrated above in the browser environment the window object is provided
  to serve as the implicit execution context.
   */
});
QUnit.test('non declared global variable assigned to window', function (assert) {
  assert.ok(window.a === undefined, 'no property a on window as of yet');
  a = 10;
  assert.ok(window.a === a && a === 10, 'global variables assigned to window object');
});
QUnit.test('local variables scoped to functions when declared in function', function (assert) {
  function func() {
    var b = 1;
  }
  assert.throws(
    function() { func(); return b;}, ReferenceError,
    'b is a local variable scoped to func(), it is not a property on the window object'
  );
  /*
  In this case the variable b is declared within the scope of func, meaning it is not available in an outer
  scope, which in this case would be the global scope.  Hence, it is not a property on th window object.
   */
});
QUnit.test('without variable declarations within a function, variables are global', function (assert) {
  function anotherFunc() {
    b = 1;
  }
  anotherFunc();
  assert.ok(window.b === b && b === 1, 'no declaration within function means variable is global');
  /*
  In this case the there is no variable declaration within the function body, just variable assignment,
  so Javascript treats b as a global variable and adds it onto the window object as a property.
   */
});
QUnit.test('deleting global variables', function (assert) {
  var a = 1;
  b = 'Hi there';
  var c = '-50';
  assert.notOk(delete a || delete c, 'cannot delete declared global variable');
  assert.ok(delete b, 'can delete undeclared but assigned global variable')
  /*
  a and c are a declared global variables so they cannot be deleted, b is an undeclared global
  variable so it can be deleted.
   */
});
QUnit.test('deleting a function in the global context', function (assert) {
  function thirdFunc() {
    return "I am a function!";
  }

  assert.notOk(delete thirdFunc, 'function declarations have the same effect as variable declarations');
});
QUnit.test('global property assignment', function (assert) {
  window.a = 1;
  b = 2;
  var c = b;
  assert.ok(window.b === b, 'property and window reference the same');
  assert.ok(c === 2, 'this should be the value of c');
  assert.ok(window.c === undefined, 'funny behavior');

  assert.ok(delete window.a && window.b, 'both a and b are globally undeclared by assigned variables');
  /*
  I am not sure why, the above turns out to be an issue, in the browser I cannot delete window.c because c
  was declared, this makes sense.  However, in this case I can delete window.c, as it behaves like an
  undeclared and uninitialized property.
   */
});
