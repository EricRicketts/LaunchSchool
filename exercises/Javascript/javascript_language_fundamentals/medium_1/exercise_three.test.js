describe('Exercises: JS210 Javascript Language Fundamentals: Medium 1: Exercise Three', function () {
  var row, i, j, padLeft, results, expected;

  beforeEach(() => {
    results = [];
    padLeft = function (number) {
      var stringNumber = String(number);
      return stringNumber.length <= 1 ? ' ' + stringNumber : stringNumber;
    }
    expected = [
      ' 9 18 27 36 45 54 63 72 81 90 \n',
      '10 20 30 40 50 60 70 80 90 100 \n'
    ]
  });

  it('does not contain the last row for multiplies of 10', function () {
    for (i = 1; i < 10; i += 1) {
      row = '';
      for (j = 1; j <= 10; j += 1) {
        row += padLeft(i * j) + ' ';
      }
      row += '\n';
      results.push(row);
    }
    expect(results).toContainEqual(expected[0]);
    expect(results).not.toContainEqual(expected[1]);
  });

  it('change ensures table includes the last row for multiples of 10', function () {
    for (i = 1; i <= 10; i += 1) { // this was the change needed i = 10 was skipped
      row = '';
      for (j = 1; j <= 10; j += 1) {
        row += padLeft(i * j) + ' ';
      }
      row += '\n';
      results.push(row);
    }
    expect(results).toContainEqual(expected[1]);
  });
});