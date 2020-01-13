function showMultiplicativeAverage(arr) {
  var arrSize = arr.length;
  var productOfNumbers;

  productOfNumbers = arr.reduce((product, n) => { return product *= n; }, 1);

  return (productOfNumbers / arrSize).toFixed(3);
}

export { showMultiplicativeAverage };