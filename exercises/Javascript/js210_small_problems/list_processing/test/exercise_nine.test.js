import { transactionsFor } from "../code/invetory_item_transactions";

describe('Exercises JS210 Small Problems List Processing Exercise Nine', function () {
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

  it('selects all transactions from the list with the correct id', function () {
    expected = [
      { id: 101, movement: "in",  quantity:  5 },
      { id: 101, movement: "in",  quantity: 12 },
      { id: 101, movement: "out", quantity: 18 },
    ];
    id = 101;

    expect(transactionsFor(id, transactions)).toEqual(expected);
  });
});