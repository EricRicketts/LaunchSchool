function reverseWords(str) {
  var wordArr = str.split(/\s+/);
  var conditionalReverse = wordArr.map(function(word) {
    return word.length > 4 ? word.split('').reverse().join('') : word;
  });

  return conditionalReverse.join(' ');
}

export { reverseWords };