function productOfSums(array1, array2) {
  return total(array1) + total(array2);
}

function total(numbers) {
  var sum = 0;
  var numSize = numbers.length;

  for (let i = 0; i < numSize; i += 1) {
    sum += numbers[i];
  }

  return sum;
}

function wrongProductOfSums(array1, array2) {
  var result;
  result = wrongTotal(array1) + wrongTotal(array2);
  return result;
}

function wrongTotal(numbers) {
  var sum;
  var i;
  // sum needs to be initialized to 0, otherwise first
  // iteration will be undefined + (a number) which will be NaN
  for (i = 0; i < numbers.length; i += 1) {
    sum += numbers[i];
  }

  sum; // without an explicit return statement the function returns undefined
}
export { wrongProductOfSums, productOfSums };