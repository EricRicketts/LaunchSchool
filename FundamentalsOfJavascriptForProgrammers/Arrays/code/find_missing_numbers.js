function missing(arr) {
  var missingNums = [];
  var sortedArr = arr.slice().sort((a, b) => a - b );

}

function range(start, stop, step) {
  return Array.from({ length: Math.floor((stop - start)/step) + 1 }, function(v, i) {
      return start + (i * step);
  });
}

export { missing, range };