describe('JS225 Object Oriented Javascript: Objects: Objects And Methods', function () {
  let greeter, counter, car;
  function evening() {
    return 'Good evening!';
  }
  function foo() {
    return this;
  }
  beforeEach(() => {
    greeter = {
      morning: function() {
        return 'Good morning!';
      }
    }

    counter = {
      count: 0,
      advance: function() {
        this.count += 1;
      },
      getThis: function() {
        return this;
      }
    }

    car = {
      fuel: 7.8,
      running: false,
      start: function() {
        this.running = true;
      }
    }
  });

  it('in function execution "this" is undefined in strict mode', function () {
    expect(foo()).toBe(undefined);
  });

  it('in method execution "this" is a reference to the object itself', function () {
    expect(counter.getThis()).toBe(counter);
  });

  it('functions do not need an object to be invoked', function () {
    expect(evening()).toBe('Good evening!');
  });

  it('methods can be assigned to a variable just like functions can', function () {
    let morningGreet = greeter.morning;  // reference to
    expect(morningGreet()).toBe('Good morning!');
  });

  it('object methods can operate on object data properties', function () {
    expect(counter.count).toBe(0);
    counter.advance();
    expect(counter.count).toBe(1);
  });

  it('methods can be added any time during the life of an object', function () {
    expect(car.running).toBe(false);
    car.start();
    expect(car.running).toBe(true);
    car.stop = function() { this.running = false; }
    car.stop();
    expect(car.running).toBe(false);
  });

  it('just like any other functions, methods can take arguments', function () {
    car.drive = function(distance) {
      this.fuel -= (distance/52);
    }
    car.start();
    car.drive(104);
    expect(car.fuel).toBe(5.8);
  });
});