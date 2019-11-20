describe('Array Operations', function () {
  var count;

  beforeEach(function () {
    count = [1, 2, 3];
  });

  it('Problem 1: Push', function (done) {
    expect(push(count, 4)).to.equal(4);
    expect(count).to.deep.equal([1, 2, 3, 4]);
    done();
  });

  it('Problem 2: Pop', function (done) {
    expect(pop(count)).to.equal(3);
    expect(count).to.deep.equal([1, 2]);
    done();
  });

  it('Problem 3: Unshift', function (done) {
    expect(unshift(count, 0)).to.equal(4);
    expect(count).to.deep.equal([0, 1, 2, 3]);
    done();
  });

  it('Problem 4: Shift', function (done) {
    expect(shift(count)).to.equal(1);
    expect(count).to.deep.equal([2, 3]);
    done();
  });
});