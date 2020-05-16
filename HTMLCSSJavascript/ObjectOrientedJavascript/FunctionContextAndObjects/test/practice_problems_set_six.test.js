let myObject = {
  count: 1,
  myChildObject: {
    myMethod: function() {
      return this.count;
    }
  }
}
let person = {
  firstName: 'Peter',
  lastName: 'Parker',
  fullName: function() {
    return this.firstName + ' ' + this.lastName + ' is the Amazing Spiderman!';
  }
}
window.a = 1;
let obj = {
  a: 2,
  func: function() {
    return this.a;
  }
}
let computer = {
  price: 30000,
  shipping: 2000,
  total: function() {
    let tax = 3000;
    function specialDiscount() {
      return this.price > 20000 ? 1000 : 0;
    }
    return this.price + this.shipping + tax - specialDiscount();
  }
}
let computerFix = {
  price: 30000,
  shipping: 2000,
  total: function () {
    let tax = 3000;

    function specialDiscount() {
      return this.price > 20000 ? 1000 : 0;
    }

    return this.price + this.shipping + tax - specialDiscount.call(this);
  }
}
QUnit.test('Problem 1: "this" is implicitly bound to nearest owning object', function (assert) {
  assert.strictEqual(myObject.myChildObject.myMethod(), undefined);
});
QUnit.test('Problem 2: call myMethod in the proper context', function (assert) {
  assert.strictEqual(myObject.myChildObject.myMethod.call(myObject), 1);
});
QUnit.test('Problem 3: use "bind" to permanently bind a function to an object', function (assert) {
  let whoIsSpiderman = person.fullName.bind(person);
  let expected = 'Peter Parker is the Amazing Spiderman!';
  assert.strictEqual(whoIsSpiderman(), expected);
});
QUnit.test('Problem 4: Understanding different contexts when invoking functions', function (assert) {
  let obj2 = {
    a: 3
  }
  assert.ok(obj.func() === 2);
  assert.ok(obj.func.call(this) === undefined);
  assert.ok(obj.func.call(obj) === 2);
  assert.ok(obj.func(obj) === 2); // Javascript will ignore the arguments
  assert.ok(obj.func.call(obj2) === 3);
});
QUnit.test('Problem 5A: function within a method loses context', function (assert) {
  assert.ok(computer.total() === 35000);
});
QUnit.test('Problem 5B: fix for function losing context within a method', function (assert) {
  assert.ok(computerFix.total() === 34000);
})