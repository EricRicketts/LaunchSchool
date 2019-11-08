describe('Practice Problems: Variable Scope Part 2', function () {
  it('Exercise 1', function (done) {
    function say () {
      if (false) {
        var a = 'hello from inside a block'
      }
      return a;
    }
    expect(say()).to.undefined;
    // if statements do not create a new inner scope, so a is scoped to
    // the function body and can be a valid return value, however, though
    // a is declared it is never assigned a value because the body of the if
    // statement never gets executed
    done();
  });

  it('Exercise 2', function (done) {
    function hello () {
      a = 'hello';
      var b = a;
      if (false) { var a = 'hello again'; }
      return b;
    }
    expect(hello()).to.equal('hello');
    expect(function () { return a; }).to.throw(ReferenceError);
    // I thought a = 'hello' was both the declaraion and assignment of a global variable
    // but it turns out with var a = 'hello again' the declaratin and the assignment
    // for the local variable a take place before the conditional is reached as the local
    // variable a is hoisted first and then assigned.
    done();
  });

  it('Exercise 3', function (done) {
    var a = 'hello';
    for (var i = 0; i < 5; i++) {
      var a = i;
    }
    expect(a).to.equal(4);
    done();
    // the hoisting inside the body of the loop has no effect because a variable "a" has already
    // been declared and hoisted.  So the last assignment to a within the body of the loop is a = 4
  });

  it('Exercise 4', function (done) {
    var a = 1;

    function foo() {
      a = 2;
      function bar() {
        a = 3;
        return 4;
      }

      return bar();
    }
    expect(foo()).to.equal(4);
    expect(a).to.equal(3);
    // calling foo returns the call to bar, which returns the value 4, in additon, the call to
    // bar sets the global variable a to the value of 3.  A variable declared in a surrouding scope
    // is accessible by any inner scope, no matter what the level of hierarchy.
    done();
  });

  it('Exercise 5', function (done) {
    var a = 'global';

    function checkScope() {
      var a = 'local';
      function nested() {
        var a = 'nested';
        function superNested() {
          a = 'superNested';
          return a;
        }

        return superNested();
      }

      return nested();
    } 
    expect(checkScope()).to.equal('superNested');   
    expect(a).to.equal('global');
    // first of all var a = 'global'; is a declaration and assignment of a variable at the global scope, its
    // value is not affected by the variable declarations and assignemnts within the function bodies because
    // those declarations and assignments are scoped to those function bodies.  So at the top level, where the
    // last assertion was made, variable 'a' keeps its initial value of 'global'.
    //
    // For the first assertion checkScope returns a call to nested which returns a call to superNested.  Within the
    // netsed call a local variable a is declared an assigned a value of 'nested'.  However, with the call to superNested
    // the variable a is reassgined to 'superNested'.  This is because a is declared in the surrounding scope of the nested
    // function and is available to all inner scopes of which the function superNested is one of them. 
    done();
  });

  it('Exercise 6', function (done) {
    var a = 'outer';
    var b = 'outer';

    // console.log(a);
    expect(a).to.equal('outer');
    // console.log(b);
    expect(b).to.equal('outer');
    setScope(a);
    // console.log(a);
    expect(a).to.equal('outer');
    // console.log(b);
    expect(b).to.equal('inner');

    function setScope(foo) {
      foo = 'inner';
      b = 'inner';
    }

    done();
    // in this case, the function declaration setScope is hoisted to the top before the variable declarations for a and b.
    // Since setScope is hoisted to the top of the global scope it declares two variables at the global level, foo and b and
    // assigns those two variables within the body of the function.  However, the variable declarations for b and foo occur
    // outside of the body of setScope.  the top level variable b get its initial value from the declaration and assignment
    // right after variable a is declared and assigned.  This value for b does not change until setScope gets called.
  });

  it('Exercise 7', function (done) {
    var total = 50;
    var increment = 15;

    function incrementBy(increment) {
      total += increment;
    }

    // console.log(total);
    expect(total).to.equal(50);
    incrementBy(10);
    // console.log(total);
    expect(total).to.equal(60);
    // console.log(increment);
    expect(increment).to.equal(15);
    done();
    // total is a variable at the global scope so it can be accessed by inner scopes such as the one created by the function
    // declaration incrementBy, so invoking the function changes the value of total.
    //
    // however, the top level variable increment remains 15 because the function parameter increment is local to the function
    // body of incrementBy and is a totally different variable than the top level variable increment.  So its value at invocation
    // has no effect on the top level variable increment.
  });

  it('Exercise 8', function (done) {
    var a = 'outer';

    // console.log(a);
    expect(a).to.equal('outer');
    expect(function () { return setScope(); }).to.throw(TypeError);
    // console.log(a);
    expect(a).to.equal('outer');

    var setScope = function () {
      a = 'inner';
    };
    done();
    // this one almost tricked me.  With regards to function expressions only the variable declarations are hoisted, the assigned
    // value only takes place where the expression exists.  Only after the assignment can the variable be called as a function.
  });
});