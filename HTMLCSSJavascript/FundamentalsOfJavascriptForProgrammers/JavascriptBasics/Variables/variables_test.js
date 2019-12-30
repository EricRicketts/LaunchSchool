describe('variable declaration and assignment', function() {
  it('declared variables without assignment are undefined', function () {
    var foo;
    expect(foo).to.be.undefined;
  });

  it('allows for dynamic typing', function () {
    var foo = 'foo';
    expect(foo).to.equal('foo');
    var foo = 3;
    expect(foo).to.equal(3);
  });
});