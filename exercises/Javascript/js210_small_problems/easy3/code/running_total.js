function runningTotal(arr) {
  var result = [];
  var sum = 0;
  arr.forEach(function(n) {
    sum += n;
    result.push(sum);
  });

  return result;
}

function runningTotalMap(arr) {
  var sum = 0;
  return arr.map(function(n, idx, currentArr) {
    return (idx === 0 ) ? sum = n : sum += currentArr[idx];
  });
}

export { runningTotal, runningTotalMap };