function processInput(input) {
  var numericalData = parseFloat(input);

  if (isNaN(numericalData)) {
    throw (new Error('Data could not be converted to numerical amount.'));
  }

  return numericalData;
}

function logTransaction(data, transactionLog) {
  // var data = prompt('Please enter the transaction amount: ');

  try {
    data = processInput(data);
    transactionLog.push(data);

    // alert('Thank you. Data accepted.');
    return 'Thank you.  Data accepted.';
  } catch {
    // alert(error.message);
    return error.message;
  }
}

function logTransactionFixed(data, transactionLog) {

  try {
    data = processInput(data);
    transactionLog.push(data);

    return 'Thank you.  Data accepted.';
  } catch(error) {
    error.message = 'incorrect data entry';
    return error.message;
  }
}

function transactionTotal(transactionLog) {
  var total = 0;
  var i;

  for (i = 0; i < transactionLog.length; i++) {
    total += transactionLog[i];
  }

  return total;
}

export { logTransaction, transactionTotal, logTransactionFixed };