import {buyFruit, buyFruitLaunchSchool } from "../code/grocery_list";

describe('Exercises JS210 Small Problems List Processing Exercise Eight', function () {
  it('returns a flattened list of grocery items', function () {
    let array = [['apple', 3], ['orange', 1], ['banana', 2]];
    let expected = ['apple', 'apple', 'apple', 'orange', 'banana', 'banana'];

    expect(buyFruit(array)).toEqual(expected);
  });

  it('Launch School solution returns a flattened list of grocery items', function () {
    let array = [['apple', 3], ['orange', 1], ['banana', 2]];
    let expected = ['apple', 'apple', 'apple', 'orange', 'banana', 'banana'];

    expect(buyFruitLaunchSchool(array)).toEqual(expected);
  });
});