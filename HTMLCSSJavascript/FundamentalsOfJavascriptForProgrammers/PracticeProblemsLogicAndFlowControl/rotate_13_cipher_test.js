describe('Rotate 13 Cipher', function () {
  var str, expected;

  it('rotates all letters by 13 locations', function (done) {
    str = 'Teachers open the door, but you must enter by yourself';
    expected = 'Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys';
    expect(rot13(str)).to.equal(expected);
    done();
  });

  it('rotating a string twice returns the original string', function (done) {
    str = 'Teachers open the door, but you must enter by yourself';
    expect(rot13(rot13(str))).to.equal(str);   
    done();
  });

  it('nonalphabetic characters are not rotated', function (done) {
    str = 'av12^_ BW';
    expected = 'ni12^_ OJ';
    expect(rot13(str)).to.equal(expected);
    done();
  });
});