function multiplyAllPairs(arr1, arr2) {
  return arr1.reduce(function(pairs, numFromArr1) {
    arr2.forEach((numFromArr2) => pairs.push(numFromArr1 * numFromArr2) )
    return pairs;
  }, []).sort((a, b) => a - b );
}

export { multiplyAllPairs };