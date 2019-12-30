describe('test the five basic data types', function() {
  it('has number data type', function () {
    expect(1.2).to.be.a('number');
  });

  it('Infinity is a numeric data type', function () {
    expect(Infinity).to.be.a('number');
  });

  it('-Infinity is a numeric data type', function () {
    expect(-Infinity).to.be.a('number');
  });

  it('NaN is a numeric data type', function () {
    expect(NaN).to.be.a('number');
  });

  it('has a string data type', function () {
    expect('Foo').to.be.a('string');
  });

  it('has an undefined data type', function () {
    expect(undefined).to.be.a('undefined');
  });

  it('has a null data type', function () {
    expect(null).to.be.a('null');
  });

  it('has a boolean data type', function () {
    expect(false).to.be.a('boolean')
  });

  it('has an object data type', function () {
    expect({ a: 1 }).to.be.a('object');
  });
});