function extractTwoNumbers(text) {
  const re = /\d+/g;
  return text.match(re);
}

function multiplyTwoStringNumbers(arr) {
  let [firstNumber, secondNumber] = [Number.parseInt(arr[0], 10), Number.parseInt(arr[1], 10)];
  return (firstNumber * secondNumber).toString(10);
}

export { extractTwoNumbers, multiplyTwoStringNumbers };