function sum(number) {
  let strNum = number.toString();
  let charNumArr = strNum.split('');

  return charNumArr.reduce(function(sum, charNum) {
    return sum += Number.parseInt(charNum, 10);
  }, 0);
}

export { sum }