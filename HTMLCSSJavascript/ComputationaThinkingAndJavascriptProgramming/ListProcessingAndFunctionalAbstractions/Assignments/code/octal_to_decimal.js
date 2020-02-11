function octalToDecimal(numberStr) {
  const LEADING_ZEROS = /^0+/;
  let normalizedNumberStr = numberStr.replace(LEADING_ZEROS, '');

  return normalizedNumberStr.split('').reverse().reduce(function(decimal, char, idx) {
    decimal += Number.parseInt(char, 10) * Math.pow(8, idx);
    return decimal;
  }, 0);
}

function octalToDecimalLaunchSchool(numberStr) {
  let length = numberStr.length;
  return numberStr.split('').reduce(function(sum, char, idx) {
    sum += Number.parseInt(char, 10) * Math.pow(8, length - idx - 1);
    return sum;
  }, 0)
}

export { octalToDecimal, octalToDecimalLaunchSchool };
/*
I also included the Launch School solution because it turned out to be cleaner
as there was no need to strip out any leading zeros.
 */