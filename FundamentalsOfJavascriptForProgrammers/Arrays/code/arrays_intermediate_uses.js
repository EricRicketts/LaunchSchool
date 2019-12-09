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
  return arr.slice().sort((a, b) => a - b).reverse();
}

export {
  combinedArray, mirrorArray, oddElementsOf, orderAndReverseOrder,
  sortDescending
};