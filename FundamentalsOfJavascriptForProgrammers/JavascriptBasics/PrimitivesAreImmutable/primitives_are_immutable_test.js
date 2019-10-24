describe('primitive values are immutable', function() {
  var str;

  beforeEach(function () {
    str = 'foo';
  });

  it('string objects do not mutate', function () {
    expect(str.toUpperCase()).to.equal('FOO');
    expect(str).to.equal('foo');
  });

  it('variables can be reassigned to new values', function () {
    expect(str).to.equal('foo');
    str = str.toUpperCase();
    expect(str).to.equal('FOO');
  });
});