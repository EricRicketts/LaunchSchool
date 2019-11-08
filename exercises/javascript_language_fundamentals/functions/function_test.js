describe('Functions', function () {
  it('Exercise 1: Local vs Global Part 1', function (done) {
    var myVar = 'this is global';
    function someFunction () {
      var myVar = 'this is local';
    }

    someFunction();
    expect(myVar).to.equal('this is global');
    done();
    // even though the function declaration is hoisted above the variable declaration for myVar
    // the myVar is within the function body is scoped to the function, so its assingment has
    // no effect on the globally scoped variable myVar
  });

  it('Exercise 2: Local vs Global Part 2', function (done) {
    var myVar = 'This is global';

    function someFunction() {
      var myVar = 'This is local';
      // console.log(myVar);
      return myVar;
    }

    expect(someFunction()).to.equal('This is local');
    done();
    // the function declaration for someFunction is hoisted above the variable declaraion for the
    // globally scoped variable myVar.  However, the declaration and assignment of myVar within
    // the function body of someFunction is a variable local to the inner scope of someFuction, and
    // it shadows the globally scoped variable, given this situation the globally scoped variable 
    // cannot be accessed to the function body returns the local value of myVar.
  });

  it('Exercise 3: Local vs Global Part 3', function (done) {
    var myVar = 'This is global';

    function someFunction() {
      myVar = 'This is local';
    }

    someFunction();
    // console.log(myVar);
    expect(myVar).to.equal('This is local');
    done();
    // in this case myVar is only scoped to the top level or global scope, as such
    // all inner scopes have access to myVar of which someFunction is one of these
    // inner scopes.  So when someFuction is called a reassignemnt takes place for
    // the value of myVar.
  });

  it('Exercise 4: Variable Lookup', function (done) {
    var myVar = 'This is global'
    function someFunction () {
      return myVar;
    }
    expect(someFunction()).to.equal('This is global')
    expect(myVar).to.equal('This is global');
    done();
    // There is only one variable declaration and assignment so myVar is accessible within the
    // inner scope of someFunction as it is scoped at the global level.  It is important to note
    // that Javascript first starts to look for a variable in the current scope and then moves
    // up the scope hierarchy choosing the first variable with the same name.  In this case, it
    // finds the variable myVar at the global level since there was not variable myVar within
    // the scope of the function someFunction.
  });

  it('Exercise 5: Variable Scope', function (done) {
    function someFunction() {
      myVar = 'This is global';
    }
    expect(function () { return myVar; }).to.throw(ReferenceError);
    someFunction();
    // console.log(myVar);
    expect(myVar).to.equal('This is global');
    done();
    // In this case with no var keyword the myVar is scoped at the global level.  However, myVar
    // only comes into existence once the function has been called, otherwise from Javascript's perspective
    // the variable does not exist, as the first assertion proves.  In reality, since Javascript cannot
    // find any variable declaration for myVar it binds myVar as a property on the global object.
  });

  it('Exercise 6: Arguments Part 1', function (done) {
    var a = 7;

    function myValue(b) {
      b += 10;
    }

    myValue(a);
    // console.log(a);
    expect(a).to.equal(7);
    done();
    // a is a variable scoped at the global level.  even though it is passed to the function myValue
    // at invocaton, a's value does not change becaue function parameters become local variables within
    // the function body and are scoped accordingly
    //
    // Launch School's explanation is more correct.  Launch School stated that a is assigned 7 and the number
    // 7 is a primitive value and primitive values are immutable.  Thus the local variable b is assigned the
    // value of a and even though b changes by another assignemnt, b+= 10; this has no effect on the value of a.
  });

  it('Exercise 7: Arguments Part 2', function (done) {
    var a = 7;

    function myValue(a) {
      a += 10;
      return a;
    }

    expect(myValue(a)).to.equal(17);
    // console.log(a);
    expect(a).to.equal(7);
    done();
    // in this case a is a variable scoped at the global level.  Even though it has a function parameter with the same
    // name in the function body, this function parameter becomes a local variable scoped to the function body.  So
    // at invocation the local variable a is assigned the value of the global variable a and then the local variable is
    // incremented and returned.  These operations within the function body have no affect on the globally scoped variable
    // a.  The value of a is a primitive value therefore it is immutable, the globally scoped variable a can only change
    // by reassignment.
    //
    // Again Launch School had a better explantion.  the local variable a shadows the globally scoped variable a so the
    // reassigmment within the function body has no effect on the global variable a.
  });

  it('Exercise 8: Arguments Part 3', function (done) {
    var a = [1, 2, 3];

    function myValue(b) {
      b[2] += 7;
    }

    myValue(a);
    // console.log(a);
    expect(a).to.deep.equal([1, 2, 10]);
    done();
    // a is an object scoped at the global level, however, objects are mutable by default, so any operation within the body
    // of the function can change the values of the object scoped at the global level.  In this case, the local variable b is
    // assigned to the same array as the global variable a is assigned to, meaning any operation on b will also change the values
    // of a.
  });

  it('Exercise 9: Variable Declarations', function (done) {
    expect(a).to.be.undefined;
    var a = 1;
    done();
    // this happens because the declaration of a is  hoisted to the top of the code base we can write the code as:
    /*
      var a; // always initialize to undefined with no assignment
      expect(a).to.be.undefined
      a = 1;
    */
  });

  it('Exercise 10: Function Declarations', function (done) {
    expect(logValue()).to.equal('Hello, world!');

    function logValue() {
      return 'Hello, world!';
    }
    done();
    // counterintutive but the function declaration for logValue is hoisted to the top of the scope, meaning the funciton is
    // fully defined and ready to be invoked even though in the code the declaration takes place after the invocation.
  });

  it('Exercsie 10: Further Exploration', function (done) {
    var logValue = 'foo';

    function logValue() {
      // console.log('Hello, world!');
      return 'Hello, world!'
    }

    // console.log(typeof logValue);
    expect(logValue).to.be.a('string');
    done();
  });
});