function decodeUsingRailCipher(str, numRails) {
  if (isTrivialCondition(str, numRails)) { return str; }
  let [strSize, skipValueArray, numSkipValues, startingIndexArray] = initializeEncodeDecode(str, numRails);
  let decodedStrArray = [];
  let currentStrIdx = 0;

  startingIndexArray.forEach((startingIndex) => {
    let currentRailIdx = startingIndex;
    while (currentRailIdx < strSize) {
      decodedStrArray[currentRailIdx] = str[currentStrIdx];
      currentStrIdx += 1;
      currentRailIdx += skipValueArray[currentRailIdx % numSkipValues];
    }
  });

  return decodedStrArray.join('');
}

function encodeUsingRailCipher(str, numRails) {
  if (isTrivialCondition(str, numRails)) { return str; }
  let [strSize, skipValueArray, numSkipValues, startingIndexArray] = initializeEncodeDecode(str, numRails);
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

function initializeEncodeDecode(str, numRails) {
  let strSize = str.length;
  let skipValueArray = generateSkipValueArray(numRails);
  let numSkipValues = skipValueArray.length;
  let startingIndexArray = range(0, numRails - 1);

  return [strSize, skipValueArray, numSkipValues, startingIndexArray];
}

function range(start, end, length = end - start + 1) {
  return Array.from({ length }, (_, i) => start + i);
}

function isTrivialCondition(str, numRails) {
  return str === '' || numRails === 1;
}

export { encodeUsingRailCipher, decodeUsingRailCipher };