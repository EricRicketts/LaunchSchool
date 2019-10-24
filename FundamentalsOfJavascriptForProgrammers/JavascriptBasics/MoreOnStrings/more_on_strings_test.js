describe('More on strings', function() {
  var str;

  beforeEach(function () {
    str = 'hello';
  });

  it('escape non paired single quotes', function () {
    expect('"It\'s hard to fail"').to.equal("\"It's hard to fail\"");
  });

  it('string concatenation', function () {
    var firstName = 'John';
    var space = ' ';
    var lastName = 'Doe';
    var fullName = firstName + space + lastName;
    expect(fullName).to.equal('John Doe');
  });

  it('strings allow character access', function () {
    expect(str.charAt(1)).to.equal('e');
  });

  it('character acces via bracket notation', function () {
    expect(str[1]).to.equal('e');
  });

  it('string length', function () {
    expect('foo'.length).to.equal(3);
  });
});