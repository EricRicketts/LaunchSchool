function union(arr1, arr2) {
  var arrJoin = arr1.concat(arr2).sort((a, b) => a - b)

  return arrJoin.filter(function(n, idx, currentArr) {
    return (idx === 0 || n !== currentArr[idx - 1]);
  })
}

export { union };