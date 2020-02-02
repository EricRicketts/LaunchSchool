function multiplyAllPairs(arr1, arr2) {
  return arr1.reduce(function(pairs, numFromArr1) {
    arr2.forEach((numFromArr2) => pairs.push(numFromArr1 * numFromArr2) )
    return pairs;
  }, []).sort((a, b) => a - b );
}

function multiplyAllPairsAlternate(arr1, arr2) {
  let numberPairs = [];

  arr1.forEach(function(numFromArr1) {
    arr2.forEach(function(numFromArr2) {
      numberPairs.push(numFromArr1 * numFromArr2);
    });
  });

  return numberPairs.sort((a, b) => a - b );
}

export { multiplyAllPairs, multiplyAllPairsAlternate };