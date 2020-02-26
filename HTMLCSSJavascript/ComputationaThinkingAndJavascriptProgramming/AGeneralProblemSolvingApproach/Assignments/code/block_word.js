function isBlockWord(word) {
  let blockLetterPairs = [
    'B:O', 'X:K', 'D:Q', 'C:P', 'N:A',
    'G:T', 'R:E', 'F:S', 'J:W', 'H:U',
    'V:I', 'L:Y', 'Z:M'
  ];
  const nonLetterRegex = /[^A-Z]/;
  let upcasedWord = word.toUpperCase();
  if(upcasedWord === '' || nonLetterRegex.test(upcasedWord)) { return false; }

  let wordArr = upcasedWord.split('');
  const wordSize = wordArr.length;

  for (let i = 0; i < wordSize; i += 1) {
    let letter = wordArr[i];
    let letterPairFound = blockLetterPairs.find((letterPair) => new RegExp(letter).test(letterPair));
    if (letterPairFound) {
      removeLetterPair(letterPairFound, blockLetterPairs)
    } else {
      return false;
    }
  }

  return true;
}

function removeLetterPair(letterPairFound, blockLetterPairs) {
  let letterPairIndex = blockLetterPairs.indexOf(letterPairFound);
  blockLetterPairs.splice(letterPairIndex, 1);
 }

export { isBlockWord };