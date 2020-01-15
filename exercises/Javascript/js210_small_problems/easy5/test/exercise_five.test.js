import { negative } from "../code/always_return_negative";

describe('Exercises JS210 Small Problems Easy Five Exercise Five', function () {
  it('negates a positive number returns a negative number', function () {
    var expected = [-5, -3, -0];
    var input = [5, -3, 0];
    var result = [];
    input.forEach((n) => result.push(negative(n)) );
    expect(result).toEqual(expected);
  });
});