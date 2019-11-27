function arraysEqual(arr1, arr2) {
    var arysAreEqual = true;
    if (arr1.length !== arr2.length) {
        return false;
    }

    for (let index = 0; index < arr1.length; index++) {
      if (arr1[index] !== arr2[index]) {
        arysAreEqual = false;
        break;
      }        
    }

    return arysAreEqual;
}

module.exports = arraysEqual;