describe('Array Operations: indexOf and lastIndexOf', function () {
  var arr;

  beforeEach(function () {
    arr = [1, 2, 3, 3];
  });

  it('indexOf finds index of first match', function (done) {
    expect(indexOf(arr, 3)).to.equal(2);
    done();
  });

  it('indexOf returns -1 with no match', function (done) {
    expect(indexOf(arr, 4)).to.equal(-1);
    done();
  });

  it('lastIndexOf finds index of should.be.at.least(value); match', function (done) {
    expect(lastIndexOf(arr, 3)).to.equal(3);
    done();
  });

  it('lastIndexOf returns -1 with no match', function (done) {
    expect(lastIndexOf(arr, 4)).to.equal(-1);
    done();
  });
});