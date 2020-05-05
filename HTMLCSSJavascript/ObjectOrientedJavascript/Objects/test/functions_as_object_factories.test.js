describe('JS225 Object Oriented Javascript: Objects: Functions As Object Factories', function () {
  function makeCar(rate) {
    return {
      speed: 0,
      rate: rate,
      accelerate: function() {
        return this.speed += this.rate;
      }
    }
  }
  function anotherMakeCar(rate, decelerate) {
    return {
      speed: 0,
      rate: rate,
      decelerate: decelerate,
      accelerate: function() {
        return this.speed += this.rate;
      },
      brake: function() {
        this.speed -= this.decelerate;
        this.speed = Math.max(0, this.speed);
        return this.speed;
      }
    }
  }

  it('should make different cars with different rates of acceleration', function () {
    let sedan = makeCar(8);
    let coupe = makeCar(12);
    let hatchback = makeCar(9);
    sedan.accelerate();
    coupe.accelerate();
    hatchback.accelerate();
    expect([sedan.speed, coupe.speed, hatchback.speed]).toEqual([8, 12, 9]);
  });

  it('added braking capability', function () {
    let sedan = anotherMakeCar(8, 6);
    sedan.accelerate();
    let firstSpeed = sedan.speed;
    sedan.brake();
    let secondSpeed = sedan.speed;
    sedan.brake();
    let thirdSpeed = sedan.speed;
    expect([firstSpeed, secondSpeed, thirdSpeed]).toEqual([8, 2, 0]);
  });
});