function getSelectedColumnsError(numbers, cols) {
  var result = [];

  for (var i = 0, length = numbers.length; i < length; i += 1) {
    for (var j = 0, length = cols.length; j < length; j += 1) {
      if (!result[j]) {
        result[j] = [];
      }
      result[j][i] = numbers[i][cols[j]];
    }
  }

  return result;
}

function getSelectedColumns(numbers, cols) {
  var result = [];
  var numbersLength = numbers.length;
  var colsLength = cols.length;

  for (var i = 0; i < numbersLength; i += 1) {
    for (var j = 0; j < colsLength; j += 1) {
      if (!result[j]) {
        result[j] = [];
      }
      result[j][i] = numbers[i][cols[j]];
    }
  }

  return result;
}

export { getSelectedColumnsError, getSelectedColumns };