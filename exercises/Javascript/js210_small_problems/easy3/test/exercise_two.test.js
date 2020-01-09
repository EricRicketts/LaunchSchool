import { searching } from '../code/searching_101';

describe('Exercises JS210 Small Problems Easy Three Execise Two', function () {
  var result, expected;

  it('if the sixth number exists in items return notification', function () {
    result = searching(25, 15, 20, 17, 23, 17);
    expected = 'The number 17 appears in [25, 15, 20, 17, 23].';
    expect(result).toBe(expected);
  });

  it('if the sixth number does not exist in items return notification', function () {
    result = searching(25, 15, 20, 17, 23, 18);
    expected = 'The number 18 does not appear in [25, 15, 20, 17, 23].';
    expect(result).toBe(expected);
  });
});