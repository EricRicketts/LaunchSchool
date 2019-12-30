describe('some javascript operators', function() {
  it('offers string comparison', function () {
    expect('a' < 'b').to.be.true;
  });

  it('boolean operators can evaluate and return non boolean values', function () {
    expect('foo' && 'bar').to.equal('bar');
  });

  it('boolean operators and values will return a boolean', function () {
    expect('a' < 'b' && 4 > 3).to.be.true;
  });
});