function myOwnEvery(array, func) {
  let arrSize = array.length;

  for (let i = 0; i < arrSize; i += 1) {
    if (!func(array[i])) {
      return false;
    }
  }

  return true;
}

function myOwnSome(array, func) {
  let arrSize = array.length;

  for (let i = 0; i < arrSize; i += 1) {
    if (func(array[i])) {
      return true;
    }
  }

  return false;
}

export { myOwnEvery, myOwnSome };