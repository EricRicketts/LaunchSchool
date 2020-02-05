import { isItemAvailable } from "../code/inventory_item_availability";

describe('Exercises JS210 Small Problems List Processing Exercise Ten', function () {
  let id, transactions, expected;

  beforeEach(() => {
    transactions = [
      { id: 101, movement: 'in',  quantity:  5 },
      { id: 105, movement: 'in',  quantity: 10 },
      { id: 102, movement: 'out', quantity: 17 },
      { id: 101, movement: 'in',  quantity: 12 },
      { id: 103, movement: 'out', quantity: 15 },
      { id: 102, movement: 'out', quantity: 15 },
      { id: 105, movement: 'in',  quantity: 25 },
      { id: 101, movement: 'out', quantity: 18 },
      { id: 102, movement: 'in',  quantity: 22 },
      { id: 103, movement: 'out', quantity: 15 },
    ];
  });

  it('returns false if item has more \'outs\' than \'ins\'', function () {
    id = 101;
    expect(isItemAvailable(id, transactions)).toBe(false);
  });

  it('returns true if item has more \'ins\' than \'outs\'', function () {
    id = 105;
    expect(isItemAvailable(id, transactions)).toBe(true);
  });
});