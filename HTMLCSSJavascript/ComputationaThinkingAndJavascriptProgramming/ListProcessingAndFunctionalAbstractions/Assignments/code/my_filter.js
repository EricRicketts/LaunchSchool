function myFilter(array, func) {
  let filteredAry = [];
  let arrSize = array.length;

  for (let i = 0; i < arrSize; i += 1) {
    if (func(array[i])) {
      filteredAry.push(array[i])
    }
  }
  return filteredAry;
}

export { myFilter };