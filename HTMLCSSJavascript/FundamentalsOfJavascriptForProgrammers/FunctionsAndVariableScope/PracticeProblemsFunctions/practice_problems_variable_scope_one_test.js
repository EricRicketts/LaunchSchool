describe('Practice Problems: Variable Scopes in Javascript Part 1', function() {
  it('Exercise 1', function (done) {
    var a = 'outer'
    function testScope() {
      var a = 'inner';
      return a;
    }
    expect(a).to.equal('outer'); // a is called in the global scope
    expect(testScope()).to.equal('inner'); // variable shadowing, a from inner scoope is returned as it was declared and assigned a value
    expect(a).to.equal('outer'); // no reassignement takes place within the funciton body because the inner a is scoped only to the function body
    done();
  });

  it('Exercise 2', function (done) {
    var a = 'outer'
    function testScope() {
      a = 'inner';
      return a;
    }
    expect(a).to.equal('outer'); // a is called in the global scope
    expect(testScope()).to.equal('inner'); // no variable shadowing, a is reassigned in the function body as it was declared in the surrounding scope and is global
    expect(a).to.equal('inner'); // result of reassignment within the function body
    done();
  });

  it('Exercise 3', function (done) {
    var basket = 'empty';

    function goShopping() {
      function shop1() {
        basket = 'tv';
      }

      // console.log(basket);
      expect(basket).to.equal('empty'); // no functions invoked, basket has original value

      function shop2() {
        basket = 'computer';
      }

      function shop3() {
        var basket = 'play station';
        expect(basket).to.equal('play station'); // added to show inner variable basket shadows global basket, so global basket does not get reassigned here
        return basket;
      }

      shop1();
      shop2();
      shop3();

      // console.log(basket);
      expect(basket).to.equal('computer'); // all inner functions called, shop2() reassigns global basket variable to 'computer'
    }

    goShopping();

    expect(basket).to.equal('computer'); // only takes place when goShopping is called as goShopping calls all of the other functions
    done();
  });

  it('Exercise 4', function (done) {
    function hello () {
      a = 'hello';
    }
    hello();
    expect(a).to.equal('hello'); // without the var keyword, a = 'hello' is a global variable declaration
    delete a;
    done();
  });

  it('Exercise 5', function (done) {
    function hello () {
      var a = 'hello';
      return a;
    }
    var x = hello();
    expect(x).to.equal('hello');
    expect(function () { return a; }).to.throw(ReferenceError);  // no where is a defined globally so it throws a reference error
    done();
  });

  it('Exercise 6', function (done) {
    expect(a).to.be.undefined;  // variable hoisting var a; which sets a to undefined, assignment to 1 occurs later in the code
    var a = 1;
    done();
  });

  it('Exercise 7', function (done) {
    expect(function () { return a; }).to.throw(ReferenceError); // despite function hoisting, hello is never called so a is never declared/assigned
    function hello () {
      a = 1;
    }
    done();
  });
});