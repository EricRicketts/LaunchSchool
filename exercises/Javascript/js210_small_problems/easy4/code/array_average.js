function average(arr) {
  var arrSize = arr.length;
  var avg = arr.reduce((sum, n) => { return sum += n }, 0) / arrSize;

  return Math.floor(avg);
}

export { average };