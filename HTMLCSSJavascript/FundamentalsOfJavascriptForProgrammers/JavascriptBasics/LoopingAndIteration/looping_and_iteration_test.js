describe('Looping and iteration', function () {
  var count, arr, expected;

  beforeEach(function () {
    arr = [];
    count = 0;
    expected = [0, 2, 4, 6, 8, 10];
  });

  it('while loop', function () {
    while (count <= 10) {
      arr.push(count);
      count += 2;
    }

    expect(arr).to.deep.equal(expected);
  });

  it('while loop with break and continue', function () {
    expected = [0, 2, 6, 8, 10];

    while (true) {
      if (count === 4) {
        count += 2;
        continue;
      }
      if (count > 10) { break; }
      arr.push(count);
      count += 2;
    }

    expect(arr).to.deep.equal(expected);
  });

  it('do while loop', function () {
    do {
      arr.push(count);
      count += 2;
    } while (count <= 10);

    expect(arr).to.deep.equal(expected);
  });

  it('for loop', function () {
    for (var i = 0; i <= 10; i += 2) {
      arr.push(i);
    }

    expect(arr).to.deep.equal(expected);
  });
});