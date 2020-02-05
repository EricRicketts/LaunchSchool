function transactionsFor(id, transactions) {
  return transactions.filter(function(singleTransaction) {
    return id === singleTransaction.id;
  })
}

export { transactionsFor };