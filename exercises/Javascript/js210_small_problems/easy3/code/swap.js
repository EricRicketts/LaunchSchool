function swap(str) {
  var strArr = str.split(/\s+/);

  return strArr.map((word) => swapLetters(word)).join(' ');
}

function swapLetters(word) {
  var lastIdx = word.length - 1;
  if (lastIdx == 0) {
    return word;
  } else {
    return word[lastIdx] + word.substring(1, lastIdx) + word[0];
  }
}

export { swap };