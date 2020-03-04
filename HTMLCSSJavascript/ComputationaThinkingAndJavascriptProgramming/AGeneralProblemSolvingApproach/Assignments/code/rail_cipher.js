function encodeUsingRailCipher(str, numRails) {
  if (str === '' || numRails === 1) { return str; }
  let strSize = str.length;
  let skipValueArray = generateSkipValueArray(numRails);
  let numSkipValues = skipValueArray.length;
  let startingIndexArray = range(0, numRails - 1);
  let encodedStr = '';

  startingIndexArray.forEach((startingIdx) => {
    let currentIdx = startingIdx;
    while (currentIdx < strSize) {
      let currentChar = str[currentIdx];
      encodedStr = encodedStr.concat(currentChar);
      currentIdx += skipValueArray[currentIdx % numSkipValues];
    }
  });

  return encodedStr;
}

function generateSkipValueArray(numRails) {
  let initialSkipValue = 2*numRails;
  let railNumberArray = range(1, numRails);
  let descendingSkipValueArray = railNumberArray.map((railNum) => {
    return (railNum === 1 || railNum === numRails) ? initialSkipValue - 2 : initialSkipValue - 2*railNum;
  });

  return descendingSkipValueArray.concat(descendingSkipValueArray.slice(1, -1));
}

function range(start, end, length = end - start + 1) {
  return Array.from({ length }, (_, i) => start + i);
}

export { encodeUsingRailCipher };