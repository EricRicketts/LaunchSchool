document.addEventListener('DOMContentLoaded', function() {
  let firstNumber = document.getElementById('first-number');
  let secondNumber = document.getElementById('second-number');
  let operation = document.getElementById('operation');
  let equals = document.getElementById('equals');
  let resultTag = document.getElementById('result');

  equals.addEventListener('click', event => {
    let operationValue = operation.value;
    let firstNumberValue = Number.parseInt(firstNumber.value, 10);
    let secondNumberValue = Number.parseInt(secondNumber.value, 10);
    let result;
    switch (operationValue) {
      case "+": {
        result = (firstNumberValue + secondNumberValue).toString();
        break;
      }
      case "-": {
        result = (firstNumberValue - secondNumberValue).toString();
        break;
      }
      case "*": {
        result = (firstNumberValue * secondNumberValue).toString();
        break;
      }
      case "/": {
        result = (firstNumberValue / secondNumberValue).toFixed(2);
      }
    }
    let resultText = document.createTextNode(result);
    resultTag.removeChild(resultTag.firstChild);
    resultTag.appendChild(resultText);
  });
});