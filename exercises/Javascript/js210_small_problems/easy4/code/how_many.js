function countOccurrences(arr) {
  var countObj = {};
  arr.forEach((str) => {
    countObj[str] = countObj[str] || 0;
    countObj[str] += 1;
  });

  return countObj;
}

export { countOccurrences };