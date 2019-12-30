describe('Practice problems primitive types and coercion', function() {
  var x, y, npa, nxx, num, bool, arr;

  beforeEach(function () {
    x = '13';
    y = 9;
    npa = 212;
    nxx = 555;
    num = 1212;
    bool = true;
    arr = [1, 2, 3];
  });

  it('coerce string to integer', function () {
    expect(x + y).to.equal('139');
    expect(parseInt(x, 10) + y).to.equal(22);
  });

  it('multiplication coerces string to number', function () {
    expect(x * y).to.equal(117);
  });

  it('coerce number to string', function () {
    phoneNumber = npa.toString() + "-" + nxx.toString() + "-" + num.toString();
    expect(phoneNumber).to.equal('212-555-1212');
  });

  it('coercie boolean and array to string', function () {
    str = bool.toString() + arr.toString();
    expect(str).to.equal('true1,2,3');
  });
});