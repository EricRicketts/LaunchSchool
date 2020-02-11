function anagram(targetWord, list) {
  return list.filter(function(wordFromList) {
    return isAnagram(targetWord, wordFromList);
  })
}

function isAnagram(wordOne, wordTwo) {
  return wordOne.split('').sort().join('') === wordTwo.split('').sort().join('');
}
export { anagram };