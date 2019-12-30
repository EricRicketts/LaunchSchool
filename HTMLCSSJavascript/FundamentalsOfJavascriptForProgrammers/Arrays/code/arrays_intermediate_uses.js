function combinedArray(first, last) { // assumes arrays of equal length
  var combinedLength = first.length + last.length;
  var ary = [];

  for (let index = 0; index < combinedLength; index++) {
    let firstAryElem = first[Math.floor(index / 2)];
    let lastAryElem = last[Math.floor(index / 2)];
    (index % 2 === 0) ? ary.push(firstAryElem) : ary.push(lastAryElem);
  }

  return ary;
}

function matrixSums(arr) {
  return arr.map(function(subArr) {
    return subArr.reduce(function(sum, num) {
      return sum += num;
    }, 0);
  });
}

function mirrorArray(arr) {
  return arr.concat(arr.slice().reverse());
}

function oddElementsOf(arr) {
  return arr.reduce(function(odds, elem, idx) {
    if ( idx % 2 === 1) { odds.push(elem); }

    return odds;
  }, []);
}

function orderAndReverseOrder(arr) {
  var arrSize = arr.length;
  var ary = [];
  
  for (var i = 0; i < arrSize; i += 1) {
    ary.push(arr[i]);
  }

  for (var i = arrSize - 1; i >= 0; i -= 1) {
    ary.push(arr[i]);
  }

  return ary;
}

function sortDescending(arr) {
  // Launch School solution better arr.slice().sort((a, b) => b - a);
  return arr.slice().sort((a, b) => a - b).reverse();
}

function uniqueElements(arr) {
  var sortedArr = arr.slice().sort((a, b) => a - b);
  return sortedArr.reduce(function(acc, elem, idx, src) {
    if (idx !== 0 && src[idx - 1] !== src[idx]) { acc.push(elem); }
    return acc;
  }, [sortedArr[0]]);
}

export {
  combinedArray, mirrorArray, matrixSums, oddElementsOf,
  orderAndReverseOrder, sortDescending, uniqueElements
};