import { transactionsFor } from "./inventory_item_transactions";

function inWarehouse(filteredTransactions) {
  return filteredTransactions.reduce(function(sum, transaction) {
     let quantity = transaction.movement === 'in' ? transaction.quantity : -1*transaction.quantity;
     return sum + quantity;
  }, 0) > 0;
}

function isItemAvailable(id, transactions) {
  let filteredTransactions = transactionsFor(id, transactions);

  return filteredTransactions.length === 0 ? false : inWarehouse(filteredTransactions);
}

export { isItemAvailable };