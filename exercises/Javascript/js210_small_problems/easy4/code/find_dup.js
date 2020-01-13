function findDup(arr) {
  var duplicate = undefined;
  var holdingArr = [];
  var lastIdx = arr.length - 1;

  for (let i = 0; i <= lastIdx; i += 1) {
    let n = arr[i];
    if (i === 0 || holdingArr.findIndex((elem) => elem === n) === -1) {
      holdingArr.push(n);
    } else {
      duplicate = n;
      break;
    }
  }

  return duplicate;
}

export { findDup };