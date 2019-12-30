describe('expressions and statements', function() {
  it('arithmetic expressions return a number', function () {
    expect(3 + 4).to.equal(7);
  });

  it('assignments are expressions after declaration', function () {
    var sum;
    expect(sum = 3 + 4).to.equal(7);
  });
});