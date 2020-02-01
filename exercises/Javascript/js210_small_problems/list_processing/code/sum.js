function sum(number) {
  let strNum = number.toString();
  let charNumArr = strNum.split('');

  return charNumArr.reduce(function(sum, charNum) {
    return sum += Number.parseInt(charNum, 10);
  }, 0);
}

function sumAlternate(number) {
  return [...String(number).match(/\d/g)].reduce(function(sum, strDigit) {
   return sum + Number.parseInt(strDigit, 10);
  }, 0);
}
export { sum, sumAlternate }