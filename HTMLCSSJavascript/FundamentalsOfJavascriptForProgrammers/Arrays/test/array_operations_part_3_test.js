describe('Array Operations Part 3: Slice, Split, Concat, and Join', function () {
  var arr;

  it('Slice an array of numbers', function (done) {
    arr = [1, 2, 3, 4, 5];
    expect(slice(arr, 0, 2)).to.deep.equal([1, 2]);
    done();
  });

  it('Slice an array of characters', function (done) {
    arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];
    expect(slice(arr, 1, 3)).to.deep.equal(['b', 'c']);
    done();
  });

  it('Splice an array', function (done) {
    arr = [1, 2, 3, 4, 5, 6, 7, 8];
    expect(splice(arr, 2, 5)).to.deep.equal([3, 4, 5, 6, 7]);
    expect(arr).to.deep.equal([1, 2, 8]);
    done();
  });

  it('Concats two arrays, first bigger than second', function (done) {
    expect(concat([1, 2, 3, 4], [5, 6])).to.deep.equal([1, 2, 3, 4, 5, 6]);
    done();  
  });

  it('Concats two arrays, second bigger than first', function (done) {
    expect(concat([1, 2], [3, 4, 5, 6])).to.deep.equal([1, 2, 3, 4, 5, 6]);
    done();  
  });

  it('Concats two arrays, both equal', function (done) {
    expect(concat([1, 2, 3], [4, 5, 6])).to.deep.equal([1, 2, 3, 4, 5, 6]);
    done();  
  });

  it('Joins an array of strings', function (done) {
    expect(join(['bri', 'tru', 'wha'], 'ck ')).to.equal('brick truck wha');
    done();
  });

  it('Joins an array of numbers', function (done) {
    expect(join([1, 2, 3], ' and ')).to.equal('1 and 2 and 3');
    done();
  });
});