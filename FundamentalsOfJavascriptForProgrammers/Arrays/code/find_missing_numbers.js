function missing(arr) {
  var missingVals = [];
  var sortedArr = arr.slice().sort((a, b) => a - b );

  arr.forEach((val, idx, currentArr) => {
    var nextVal = currentArr[idx + 1];
    if (nextVal > val + 1) {
      missingVals.push(range(val + 1, nextVal - 1, 1));
    }
  });

  return missingVals.flat();
}

function range(start, stop, step) {
  return Array.from({ length: Math.floor((stop - start)/step) + 1 }, function(v, i) {
      return start + (i * step);
  });
}

export { missing, range };